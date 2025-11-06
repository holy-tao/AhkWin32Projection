#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposed by objects that act as a proxy for a remote object.
 * @see https://docs.microsoft.com/windows/win32/api//mfidl/nn-mfidl-imfremoteproxy
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFRemoteProxy extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFRemoteProxy
     * @type {Guid}
     */
    static IID => Guid("{994e23ad-1cc2-493c-b9fa-46f1cb040fa4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetRemoteObject", "GetRemoteHost"]

    /**
     * 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfremoteproxy-getremoteobject
     */
    GetRemoteObject(riid) {
        result := ComCall(3, this, "ptr", riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }

    /**
     * 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfremoteproxy-getremotehost
     */
    GetRemoteHost(riid) {
        result := ComCall(4, this, "ptr", riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }
}
