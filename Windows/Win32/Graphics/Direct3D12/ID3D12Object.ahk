#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * An interface from which ID3D12Device and ID3D12DeviceChild inherit from. It provides methods to associate private data and annotate object names.
 * @see https://docs.microsoft.com/windows/win32/api//d3d12/nn-d3d12-id3d12object
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class ID3D12Object extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D12Object
     * @type {Guid}
     */
    static IID => Guid("{c4fec28f-7966-4e95-9f94-f431cb56c3b8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetPrivateData", "SetPrivateData", "SetPrivateDataInterface", "SetName"]

    /**
     * Gets application-defined data from a device object.
     * @param {Pointer<Guid>} guid Type: <b><a href="https://docs.microsoft.com/openspecs/windows_protocols/ms-oaut/6e7d7108-c213-40bc-8294-ac13fe68fd50">REFGUID</a></b>
     * 
     * The <b>GUID</b> that is associated with the data.
     * @param {Pointer<Integer>} pDataSize Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a>*</b>
     * 
     * A pointer to a variable that on input contains the size, in bytes, of the buffer that <i>pData</i> points to, and on output contains the size, in bytes, of the amount of data that <b>GetPrivateData</b> retrieved.
     * @param {Pointer} pData Type: <b>void*</b>
     * 
     * A pointer to a memory block that receives the data from the device object if <i>pDataSize</i> points to a value that specifies a buffer large enough to hold the data.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * This method returns one of the <a href="/windows/desktop/direct3d12/d3d12-graphics-reference-returnvalues">Direct3D 12 Return Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//d3d12/nf-d3d12-id3d12object-getprivatedata
     */
    GetPrivateData(guid, pDataSize, pData) {
        pDataSizeMarshal := pDataSize is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "ptr", guid, pDataSizeMarshal, pDataSize, "ptr", pData, "HRESULT")
        return result
    }

    /**
     * Sets application-defined data to a device object and associates that data with an application-defined GUID.
     * @param {Pointer<Guid>} guid Type: <b><a href="https://docs.microsoft.com/openspecs/windows_protocols/ms-oaut/6e7d7108-c213-40bc-8294-ac13fe68fd50">REFGUID</a></b>
     * 
     * The <b>GUID</b> to associate with the data.
     * @param {Integer} DataSize Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The size in bytes of the data.
     * @param {Pointer} pData Type: <b>const void*</b>
     * 
     * A pointer to a memory block that contains the data to be stored with this device object. If <i>pData</i> is <b>NULL</b>, <i>DataSize</i> must also be 0, and any data that was previously associated with the <b>GUID</b> specified in <i>guid</i> will be destroyed.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * This method returns one of the <a href="/windows/desktop/direct3d12/d3d12-graphics-reference-returnvalues">Direct3D 12 Return Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//d3d12/nf-d3d12-id3d12object-setprivatedata
     */
    SetPrivateData(guid, DataSize, pData) {
        result := ComCall(4, this, "ptr", guid, "uint", DataSize, "ptr", pData, "HRESULT")
        return result
    }

    /**
     * Associates an IUnknown-derived interface with the device object and associates that interface with an application-defined GUID.
     * @param {Pointer<Guid>} guid Type: <b><a href="https://docs.microsoft.com/openspecs/windows_protocols/ms-oaut/6e7d7108-c213-40bc-8294-ac13fe68fd50">REFGUID</a></b>
     * 
     * The <b>GUID</b> to associate with the interface.
     * @param {IUnknown} pData Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a>*</b>
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a>-derived interface to be associated with the device object.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * This method returns one of the <a href="/windows/desktop/direct3d12/d3d12-graphics-reference-returnvalues">Direct3D 12 Return Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//d3d12/nf-d3d12-id3d12object-setprivatedatainterface
     */
    SetPrivateDataInterface(guid, pData) {
        result := ComCall(5, this, "ptr", guid, "ptr", pData, "HRESULT")
        return result
    }

    /**
     * Associates a name with the device object. This name is for use in debug diagnostics and tools.
     * @param {PWSTR} Name Type: <b>LPCWSTR</b>
     * 
     * A <b>NULL</b>-terminated <b>UNICODE</b> string that contains the name to associate with the device object.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * This method returns one of the <a href="/windows/desktop/direct3d12/d3d12-graphics-reference-returnvalues">Direct3D 12 Return Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//d3d12/nf-d3d12-id3d12object-setname
     */
    SetName(Name) {
        Name := Name is String ? StrPtr(Name) : Name

        result := ComCall(6, this, "ptr", Name, "HRESULT")
        return result
    }
}
