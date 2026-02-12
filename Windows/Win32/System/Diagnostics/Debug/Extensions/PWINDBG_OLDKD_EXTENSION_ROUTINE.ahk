#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class PWINDBG_OLDKD_EXTENSION_ROUTINE extends IUnknown {

    static sizeof => A_PtrSize

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Invoke"]

    /**
     * Invokes helper functionality for the IDispatch interface.
     * @param {Integer} dwCurrentPc 
     * @param {Pointer<WINDBG_OLDKD_EXTENSION_APIS>} lpExtensionApis 
     * @param {PSTR} lpArgumentString 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(dwCurrentPc, lpExtensionApis, lpArgumentString) {
        lpArgumentString := lpArgumentString is String ? StrPtr(lpArgumentString) : lpArgumentString

        ComCall(3, this, "uint", dwCurrentPc, "ptr", lpExtensionApis, "ptr", lpArgumentString)
    }
}
