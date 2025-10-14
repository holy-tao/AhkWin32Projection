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
    owned {
        get => this.__owned
        set{
            if(this.HasProp("__ptr"))
                throw PropertyError("This property is read-only", , "owned")
            this.__owned := value
        }
    }

    /**
     * Indicates whether or not the handle is valid. 
     * 
     * @remarks
     * Note that not all handles have invalid values listed in the metadata - if none are listed, 
     * this property is always `true`.
     * @type {Boolean}
     */
    IsValid {
        get {
            thisVal := NumGet(this, "ptr")

            for(val in Win32Struct.ResolveClassName(this.__Class).invalidValues){
                if(thisVal == val)
                    return false
            }
            return true
        }
    }

    /**
     * Initializes a new `Win32Handle` from a pointer.
     * 
     * @param {Integer} ptr pointer to the memory location at which to create the struct,
     *          or 0 to create a new one
     * @param {Boolean} owned true if this handle is owned by the script and must be freed
     *          by it, false otherwise 
     */
    __New(ptr := 0, owned := true){
        super.__New(ptr)
        this.owned := owned
    }
}