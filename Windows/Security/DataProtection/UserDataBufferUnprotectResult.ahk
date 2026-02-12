#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IUserDataBufferUnprotectResult.ahk
#Include ..\..\..\Guid.ahk

/**
 * Contains result status of unprotecting a buffer and if succeeded, the unprotected buffer.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.security.dataprotection.userdatabufferunprotectresult
 * @namespace Windows.Security.DataProtection
 * @version WindowsRuntime 1.4
 */
class UserDataBufferUnprotectResult extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IUserDataBufferUnprotectResult

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IUserDataBufferUnprotectResult.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Result status of unprotecting a buffer.
     * @see https://learn.microsoft.com/uwp/api/windows.security.dataprotection.userdatabufferunprotectresult.status
     * @type {Integer} 
     */
    Status {
        get => this.get_Status()
    }

    /**
     * Copy of the unprotected buffer, if the unprotect call succeeded.
     * @see https://learn.microsoft.com/uwp/api/windows.security.dataprotection.userdatabufferunprotectresult.unprotectedbuffer
     * @type {IBuffer} 
     */
    UnprotectedBuffer {
        get => this.get_UnprotectedBuffer()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Status() {
        if (!this.HasProp("__IUserDataBufferUnprotectResult")) {
            if ((queryResult := this.QueryInterface(IUserDataBufferUnprotectResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserDataBufferUnprotectResult := IUserDataBufferUnprotectResult(outPtr)
        }

        return this.__IUserDataBufferUnprotectResult.get_Status()
    }

    /**
     * 
     * @returns {IBuffer} 
     */
    get_UnprotectedBuffer() {
        if (!this.HasProp("__IUserDataBufferUnprotectResult")) {
            if ((queryResult := this.QueryInterface(IUserDataBufferUnprotectResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserDataBufferUnprotectResult := IUserDataBufferUnprotectResult(outPtr)
        }

        return this.__IUserDataBufferUnprotectResult.get_UnprotectedBuffer()
    }

;@endregion Instance Methods
}
