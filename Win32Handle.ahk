#Requires AutoHotkey v2.0
#Include Win32Struct.ahk

/**
 * The Win32Handle type wraps OS handles. Generated types which extend it
 * may implement a destructor which frees the handle when the AutoHotkey
 * object is freed
 */
class Win32Handle extends Win32Struct {

    /**
     * @readonly Indicates whether or not this handle is owned by the script. If this value
     *          is `true`, the handle is freed when the AHK object falls out of scope if a
     *          destructor was defined in the metadata
     * @type {Boolean}
     */
    owned := unset

    /**
     * Indicates whether or not the handle is valid. 
     * 
     * @remarks
     * Note that not all handles have invalid values listed in the metadata - even if none are
     * listed, the value 0 is always considered invalid
     * @type {Boolean}
     */
    valid {
        get {
            thisVal := NumGet(this, "ptr")

            for(val in Win32Struct.ResolveClassName(this.__Class).invalidValues){
                if(thisVal == val)
                    return false
            }
            return thisVal != 0
        }
    }

    static invalidValues => []

    /**
     * Initializes a new `Win32Handle`. Pass either a pointer to the memory address at which
     * to intialize the handle struct, or an object with a `Value` property to initialize a
     * new handle with its value:
     * 
     *      myHandle := HANDLE({Value: 0xFFFFFFFF})
     * 
     * @param {Integer} ptrOrObj pointer or object with which to initialize the struct. If
     *          `ownedOrParent` is the handle's parent struct (the struct in which it is
     *          embedded), this is an offset into its memory block
     * @param {Win32Struct | Boolean} ownedOrParent If an object, the handle's parent struct,
     *          otherwise, indicates whether or not the handle is owned by the scrupt and must
     *          be freed by it. If an object, ownership is inherited from the parent
     */
    __New(ptrOrObj := 0, ownedOrParent := true){
        if(IsObject(ownedOrParent)){
            super.__New(ptrOrObj, ownedOrParent)
            this.owned := this._parent._owned
        }
        else{
            super.__New(ptrOrObj)
            this.owned := ownedOrParent
        }   
    }

    /**
     * Creates and returns a script-owned handle with an invalid value
     * @returns {Win32Handle} the new handle
     */
    static Invalid(){
        value := this.invalidValues.Has(1) ? this.invalidValues[1] : 0
        handle := this({Value: value}, true)
        return handle
    }

    /**
     * Closes the handle if a destructor is defined in the metadata. Not all handles have
     * destructors defined (e.g. `HWND`); if no destructor is defined, this method does nothing
     */
    Free(){
        ; Implemented by extending classes
    }

    /**
     * Clones the handle into a script-controlled memory block. Cloning an owned handle transfers
     * ownership to the returned clone. Cloning an unowned handle is an error
     * @throws {Error} if the handle is not owned by the script
     */
    Clone(){
        if(!this.owned){
            throw Error("Cannot clone an unowned handle")
        }

        cln := super.Clone()

        cln.owned := this.owned
        this.owned := false

        return cln
    }

    __Delete(){
        if(this.owned && this.valid){
            this.Free()
        }
    }
}