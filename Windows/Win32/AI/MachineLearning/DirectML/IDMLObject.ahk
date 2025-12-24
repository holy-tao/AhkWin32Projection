#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * An interface from which IDMLDevice and IDMLDeviceChild inherit directly (and all other interfaces, indirectly).
 * @see https://docs.microsoft.com/windows/win32/api//directml/nn-directml-idmlobject
 * @namespace Windows.Win32.AI.MachineLearning.DirectML
 * @version v4.0.30319
 */
class IDMLObject extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDMLObject
     * @type {Guid}
     */
    static IID => Guid("{c8263aac-9e0c-4a2d-9b8e-007521a3317c}")

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
     * Gets application-defined data from a DirectML device object.
     * @param {Pointer<Guid>} guid Type: **[REFGUID](/openspecs/windows_protocols/ms-oaut/6e7d7108-c213-40bc-8294-ac13fe68fd50)**
     * 
     * The <b>GUID</b> that is associated with the data.
     * @param {Pointer<Integer>} dataSize Type: <b>[UINT](/windows/desktop/winprog/windows-data-types)*</b>
     * 
     * A pointer to a variable that on input contains the size, in bytes, of the buffer that <i>data</i> points to, and on output contains the size, in bytes, of the amount of data that <b>GetPrivateData</b> retrieved.
     * @param {Pointer} data Type: <b>void*</b>
     * 
     * A pointer to a memory block that receives the data from the device object if <i>dataSize</i> points to a value that specifies a buffer large enough to hold the data.
     * @returns {HRESULT} Type: [**HRESULT**](/windows/desktop/winprog/windows-data-types)
     * 
     * If this method succeeds, it returns **S_OK**. Otherwise, it returns an **HRESULT** error code.
     * @see https://docs.microsoft.com/windows/win32/api//directml/nf-directml-idmlobject-getprivatedata
     */
    GetPrivateData(guid, dataSize, data) {
        dataSizeMarshal := dataSize is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "ptr", guid, dataSizeMarshal, dataSize, "ptr", data, "HRESULT")
        return result
    }

    /**
     * Sets application-defined data to a DirectML device object, and associates that data with an application-defined GUID.
     * @param {Pointer<Guid>} guid Type: <b><a href="https://docs.microsoft.com/openspecs/windows_protocols/ms-oaut/6e7d7108-c213-40bc-8294-ac13fe68fd50">REFGUID</a></b>
     * 
     * The <b>GUID</b> to associate with the data.
     * @param {Integer} dataSize Type: [**UINT**](/windows/desktop/winprog/windows-data-types)
     * 
     * The size in bytes of the data.
     * @param {Pointer} data Type: <b>const void*</b>
     * 
     * A pointer to a memory block that contains the data to be stored with this DirectML device object. If <i>data</i> is <b>NULL</b>, then <i>dataSize</i> must be 0, and any data that was previously associated with the <b>GUID</b> specified in <i>guid</i> will be destroyed.
     * @returns {HRESULT} Type: [**HRESULT**](/windows/desktop/winprog/windows-data-types)
     * 
     * If this method succeeds, it returns **S_OK**. Otherwise, it returns an **HRESULT** error code.
     * @see https://docs.microsoft.com/windows/win32/api//directml/nf-directml-idmlobject-setprivatedata
     */
    SetPrivateData(guid, dataSize, data) {
        result := ComCall(4, this, "ptr", guid, "uint", dataSize, "ptr", data, "HRESULT")
        return result
    }

    /**
     * Associates an IUnknown-derived interface with the DirectML device object, and associates that interface with an application-defined GUID.
     * @param {Pointer<Guid>} guid Type: <b><a href="https://docs.microsoft.com/openspecs/windows_protocols/ms-oaut/6e7d7108-c213-40bc-8294-ac13fe68fd50">REFGUID</a></b>
     * 
     * The <b>GUID</b> to associate with the interface.
     * @param {IUnknown} data Type: <b>const <a href="https://docs.microsoft.com/windows/win32/api/unknwn/nn-unknwn-iunknown">IUnknown</a>*</b>
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/win32/api/unknwn/nn-unknwn-iunknown">IUnknown</a>-derived interface to be associated with the device object.
     * @returns {HRESULT} Type: [**HRESULT**](/windows/desktop/winprog/windows-data-types)
     * 
     * If this method succeeds, it returns **S_OK**. Otherwise, it returns an **HRESULT** error code.
     * @see https://docs.microsoft.com/windows/win32/api//directml/nf-directml-idmlobject-setprivatedatainterface
     */
    SetPrivateDataInterface(guid, data) {
        result := ComCall(5, this, "ptr", guid, "ptr", data, "HRESULT")
        return result
    }

    /**
     * Associates a name with the DirectML device object. This name is for use in debug diagnostics and tools.
     * @param {PWSTR} name Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">PCWSTR</a></b>
     * 
     * A <b>NULL</b>-terminated <b>UNICODE</b> string that contains the name to associate with the DirectML device object.
     * @returns {HRESULT} Type: [**HRESULT**](/windows/desktop/winprog/windows-data-types)
     * 
     * If this method succeeds, it returns **S_OK**. Otherwise, it returns an **HRESULT** error code.
     * @see https://docs.microsoft.com/windows/win32/api//directml/nf-directml-idmlobject-setname
     */
    SetName(name) {
        name := name is String ? StrPtr(name) : name

        result := ComCall(6, this, "ptr", name, "HRESULT")
        return result
    }
}
