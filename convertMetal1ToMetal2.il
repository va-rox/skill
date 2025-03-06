procedure(convertMetal1ToMetal2()
    let((cv metal1Layer metal2Layer shapes shape)
        cv = geGetEditCellView()  ;; Get the currently open layout
        if(cv == nil then
            error("No layout is currently open!")
        )

        ;; Define the layers (Adjust layer numbers based on your technology)
        metal1Layer = list("metal1" "drawing")
        metal2Layer = list("metal2" "drawing")

        ;; Find all shapes on metal1
        shapes = dbGetTrueOverlaps(cv metal1Layer nil)

        foreach(shape shapes
            dbSetq(shape "layer" metal2Layer)  ;; Change layer to metal2
        )

        ;; Save the changes
        dbSave(cv)
        printf("Converted %d shapes from metal1 to metal2.\n" length(shapes))
    )
)

;; Run the function
convertMetal1ToMetal2()
