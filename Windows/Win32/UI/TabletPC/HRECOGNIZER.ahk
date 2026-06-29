#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\Apis.ahk" { DestroyRecognizer }

/**
 * An HRECOGNIZER handle is used to create a recognizer context, retrieve the recognizer's attributes and properties, and determine which packet properties the recognizer requires to perform recognition.
 * @remarks
 * The following functions use an **HRECOGNIZER**.
 * 
 * 
 * 
 * | Function                                                               | Description                                                                                        |
 * |------------------------------------------------------------------------|----------------------------------------------------------------------------------------------------|
 * | [**CreateRecognizer**](/windows/desktop/api/recapis/nf-recapis-createrecognizer)                           | Creates a recognizer.<br/>                                                                   |
 * | [**DestroyRecognizer**](/windows/desktop/api/recapis/nf-recapis-destroyrecognizer)                         | Destroys a recognizer.<br/>                                                                  |
 * | [**GetRecoAttributes**](/windows/desktop/api/recapis/nf-recapis-getrecoattributes)                         | Returns the attributes of the recognizer.<br/>                                               |
 * | [**CreateContext**](/windows/desktop/api/recapis/nf-recapis-createcontext)                                 | Creates a recognizer context.<br/>                                                           |
 * | [**DestroyContext**](/windows/desktop/api/recapis/nf-recapis-destroycontext)                               | Destroys a recognizer context.<br/>                                                          |
 * | [**GetAllRecognizers**](/windows/desktop/api/recapis/nf-recapis-getallrecognizers)                         | Gets all recognizers.<br/>                                                                   |
 * | [**GetResultPropertyList**](/windows/desktop/api/recapis/nf-recapis-getresultpropertylist)                 | Retrieves a list of properties the recognizer can return for a result range.<br/>            |
 * | [**GetPreferredPacketDescription**](/windows/desktop/api/recapis/nf-recapis-getpreferredpacketdescription) | Retrieves a packet description that contains the packet properties the recognizer uses.<br/> |
 * | [**GetUnicodeRanges**](/windows/desktop/api/recapis/nf-recapis-getunicoderanges)                           | Retrieves the ranges of Unicode points that the recognizer supports.<br/>                    |
 * | [**LoadCachedAttributes**](/windows/desktop/api/recapis/nf-recapis-loadcachedattributes)                   | Loads the cached attributes of a recognizer.<br/>                                            |
 * @see https://learn.microsoft.com/windows/win32/tablet/hrecognizer-handle
 * @namespace Windows.Win32.UI.TabletPC
 */
export default struct HRECOGNIZER {
    Value : IntPtr

    __value {
        set {
            if (value is HRECOGNIZER) {
                this.Value := value.Value
            }
            else {
                this.Value := value
            }
        }
    }

    /**
     * The list of values which indicate that the handle is invalid
     * @type {Array<Integer>}
     */
    static invalidValues => [-1, 0]

    __New(Value := -1) {
        this.Value := Value
    }

    Free() {
        ; Do nothing if the handle is invalid already
        if (this.Value != -1 && this.Value != 0) {
            DestroyRecognizer(this.Value)
            this.Value := -1
        }
    }

    /**
     * A `HRECOGNIZER` which is owned by the script and which frees itself
     * in `__Delete`.
     */
    struct Owned extends HRECOGNIZER {
        __Delete() {
            this.Free()
        }
    }

    /**
     * Takes ownership of this HRECOGNIZER, returning an owned handle that frees
     * itself when it falls out of scope. This is a *move*: the original handle is
     * invalidated so the underlying resource has exactly one owner.
     * @returns {HRECOGNIZER.Owned}
     */
    Adopt() {
        if (this is HRECOGNIZER.Owned) {
            throw TypeError("Cannot adopt an owned HRECOGNIZER", -1)
        }
        owned := HRECOGNIZER.Owned(this.Value)
        this.Value := -1
        return owned
    }
}
