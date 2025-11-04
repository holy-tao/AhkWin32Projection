#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Marshals an interface pointer to and from a stream.Stream objects that support IStream can expose this interface to provide custom marshaling for interface pointers.
 * @see https://docs.microsoft.com/windows/win32/api//mfidl/nn-mfidl-imfobjectreferencestream
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFObjectReferenceStream extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFObjectReferenceStream
     * @type {Guid}
     */
    static IID => Guid("{09ef5be3-c8a7-469e-8b70-73bf25bb193f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SaveReference", "LoadReference"]

    /**
     * 
     * @param {Pointer<Guid>} riid 
     * @param {IUnknown} pUnk 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfobjectreferencestream-savereference
     */
    SaveReference(riid, pUnk) {
        result := ComCall(3, this, "ptr", riid, "ptr", pUnk, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Pointer<Void>>} ppv 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfobjectreferencestream-loadreference
     */
    LoadReference(riid, ppv) {
        ppvMarshal := ppv is VarRef ? "ptr*" : "ptr"

        result := ComCall(4, this, "ptr", riid, ppvMarshal, ppv, "HRESULT")
        return result
    }
}
