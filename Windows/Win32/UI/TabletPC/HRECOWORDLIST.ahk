#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\Apis.ahk" { DestroyWordList }

/**
 * An HRECOWORDLIST handle is used to manage a word list you attach to a recognizer context. You use a word list to improve recognition results.
 * @remarks
 * The following function use an **HRECOWORDLIST**.
 * 
 * 
 * 
 * | Function                                         | Description                                         |
 * |--------------------------------------------------|-----------------------------------------------------|
 * | [**AddWordsToWordList**](/windows/desktop/api/recapis/nf-recapis-addwordstowordlist) | Adds one or more words to the word list.<br/> |
 * | [**DestroyWordList**](/windows/desktop/api/recapis/nf-recapis-destroywordlist)       | Destroys the current word list.<br/>          |
 * | [**MakeWordList**](/windows/desktop/api/recapis/nf-recapis-makewordlist)             | Creates a word list.<br/>                     |
 * @see https://learn.microsoft.com/windows/win32/tablet/hrecowordlist-handle
 * @namespace Windows.Win32.UI.TabletPC
 */
export default struct HRECOWORDLIST {
    Value : IntPtr

    __value {
        set {
            if (value is HRECOWORDLIST) {
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
            DestroyWordList(this.Value)
            this.Value := -1
        }
    }

    /**
     * A `HRECOWORDLIST` which is owned by the script and which frees itself
     * in `__Delete`.
     */
    struct Owned extends HRECOWORDLIST {
        __Delete() {
            this.Free()
        }
    }

    /**
     * Takes ownership of this HRECOWORDLIST, returning an owned handle that frees
     * itself when it falls out of scope. This is a *move*: the original handle is
     * invalidated so the underlying resource has exactly one owner.
     * @returns {HRECOWORDLIST.Owned}
     */
    Adopt() {
        if (this is HRECOWORDLIST.Owned) {
            throw TypeError("Cannot adopt an owned HRECOWORDLIST", -1)
        }
        owned := HRECOWORDLIST.Owned(this.Value)
        this.Value := -1
        return owned
    }
}
