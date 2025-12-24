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
     * Stores the data needed to marshal an interface across a process boundary.
     * @param {Pointer<Guid>} riid Interface identifier of the interface to marshal.
     * @param {IUnknown} pUnk Pointer to the <b>IUnknown</b> interface.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imfobjectreferencestream-savereference
     */
    SaveReference(riid, pUnk) {
        result := ComCall(3, this, "ptr", riid, "ptr", pUnk, "HRESULT")
        return result
    }

    /**
     * Marshals an interface from data stored in the stream.
     * @param {Pointer<Guid>} riid Interface identifier of the interface to marshal.
     * @returns {Pointer<Void>} Receives a pointer to the requested interface. The caller must release the interface.
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imfobjectreferencestream-loadreference
     */
    LoadReference(riid) {
        result := ComCall(4, this, "ptr", riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }
}
