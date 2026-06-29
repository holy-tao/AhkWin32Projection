#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\Apis.ahk" { DdqFreeDiagnosticRecordProducerCategories }

/**
 * @namespace Windows.Win32.Security.DiagnosticDataQuery
 */
export default struct HDIAGNOSTIC_EVENT_CATEGORY_DESCRIPTION {
    Value : IntPtr

    __value {
        set {
            if (value is HDIAGNOSTIC_EVENT_CATEGORY_DESCRIPTION) {
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
            DdqFreeDiagnosticRecordProducerCategories(this.Value)
            this.Value := -1
        }
    }

    /**
     * A `HDIAGNOSTIC_EVENT_CATEGORY_DESCRIPTION` which is owned by the script and which frees itself
     * in `__Delete`.
     */
    struct Owned extends HDIAGNOSTIC_EVENT_CATEGORY_DESCRIPTION {
        __Delete() {
            this.Free()
        }
    }

    /**
     * Takes ownership of this HDIAGNOSTIC_EVENT_CATEGORY_DESCRIPTION, returning an owned handle that frees
     * itself when it falls out of scope. This is a *move*: the original handle is
     * invalidated so the underlying resource has exactly one owner.
     * @returns {HDIAGNOSTIC_EVENT_CATEGORY_DESCRIPTION.Owned}
     */
    Adopt() {
        if (this is HDIAGNOSTIC_EVENT_CATEGORY_DESCRIPTION.Owned) {
            throw TypeError("Cannot adopt an owned HDIAGNOSTIC_EVENT_CATEGORY_DESCRIPTION", -1)
        }
        owned := HDIAGNOSTIC_EVENT_CATEGORY_DESCRIPTION.Owned(this.Value)
        this.Value := -1
        return owned
    }
}
