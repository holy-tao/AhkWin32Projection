#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\Apis.ahk" { WindowsDeleteStringBuffer }

/**
 * A handle to a mutable string buffer that you can use to create an HSTRING.
 * @remarks
 * **HSTRING\_BUFFER** represents a string buffer that you can modify before converting it to an immutable [**HSTRING**](hstring.md).
 * 
 * Call the [**WindowsPreallocateStringBuffer**](/windows/win32/api/winstring/nf-winstring-windowspreallocatestringbuffer) function to create an **HSTRING\_BUFFER**. Call the [**WindowsPromoteStringBuffer**](/windows/win32/api/winstring/nf-winstring-windowspromotestringbuffer) to convert an **HSTRING\_BUFFER** to an immutable [**HSTRING**](hstring.md).
 * @see https://learn.microsoft.com/windows/win32/WinRT/hstring-buffer
 * @namespace Windows.Win32.System.WinRT
 */
export default struct HSTRING_BUFFER {
    Value : IntPtr

    __value {
        set {
            if (value is HSTRING_BUFFER) {
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
            WindowsDeleteStringBuffer(this.Value)
            this.Value := -1
        }
    }

    /**
     * A `HSTRING_BUFFER` which is owned by the script and which frees itself
     * in `__Delete`.
     */
    struct Owned extends HSTRING_BUFFER {
        __Delete() {
            this.Free()
        }
    }

    /**
     * Takes ownership of this HSTRING_BUFFER, returning an owned handle that frees
     * itself when it falls out of scope. This is a *move*: the original handle is
     * invalidated so the underlying resource has exactly one owner.
     * @returns {HSTRING_BUFFER.Owned}
     */
    Adopt() {
        if (this is HSTRING_BUFFER.Owned) {
            throw TypeError("Cannot adopt an owned HSTRING_BUFFER", -1)
        }
        owned := HSTRING_BUFFER.Owned(this.Value)
        this.Value := -1
        return owned
    }
}
