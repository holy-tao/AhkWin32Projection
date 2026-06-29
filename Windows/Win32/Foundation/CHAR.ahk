#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Foundation
 */
export default struct CHAR {
    value : Int8

    __value {
        set {
            if (value is CHAR) {
                this.value := value.value
            }
            else {
                this.value := value is String ? Ord(value) : value
            }
        }
    }

    __New(value := 0) {
        this.value := value
    }

    static __Item[Length] {
        get {
            cls := super[Length]
            if (!ObjHasOwnProp(cls.Prototype, "__StringArrayHooked")) {
                DefineProp(cls.Prototype, "__value", {
                    set: (this, value) => StrPut(value, this.Ptr, this.Length, "UTF-8")
                })
                DefineProp(cls.Prototype, "ToString", {
                    Call: (this) => StrGet(this.Ptr, this.Length, "UTF-8")
                })
                DefineProp(cls.Prototype, "__StringArrayHooked", { value: true })
            }
            return cls
        }
    }
    
}
