#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Networking.WinInet
 * @version v4.0.30319
 */
class LPINTERNET_STATUS_CALLBACK extends IUnknown {

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
     * @param {Pointer<Void>} hInternet 
     * @param {Pointer} dwContext 
     * @param {Integer} dwInternetStatus 
     * @param {Pointer<Void>} lpvStatusInformation 
     * @param {Integer} dwStatusInformationLength 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(hInternet, dwContext, dwInternetStatus, lpvStatusInformation, dwStatusInformationLength) {
        hInternetMarshal := hInternet is VarRef ? "ptr" : "ptr"
        lpvStatusInformationMarshal := lpvStatusInformation is VarRef ? "ptr" : "ptr"

        ComCall(3, this, hInternetMarshal, hInternet, "ptr", dwContext, "uint", dwInternetStatus, lpvStatusInformationMarshal, lpvStatusInformation, "uint", dwStatusInformationLength)
    }
}
