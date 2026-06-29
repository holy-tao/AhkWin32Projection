#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IMDSPObject.ahk" { IMDSPObject }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * Windows Media Device Manager uses IMDSPObject2 to enable more efficient file reading and writing.Note  Unless the service provider has added the device parameter UseExtendedWmdm with a value of 1, Windows Media Device Manager will not call this interface. See Device Parameters for more information about this. .
 * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nn-mswmdm-imdspobject2
 * @namespace Windows.Win32.Media.DeviceManager
 */
export default struct IMDSPObject2 extends IMDSPObject {
    /**
     * The interface identifier for IMDSPObject2
     * @type {Guid}
     */
    static IID := Guid("{3f34cd3e-5907-4341-9af9-97f4187c3aa5}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMDSPObject2 interfaces
    */
    struct Vtbl extends IMDSPObject.Vtbl {
        ReadOnClearChannel  : IntPtr
        WriteOnClearChannel : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMDSPObject2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The ReadOnClearChannel method reads data from the object at the current position without using secure authenticated channels.
     * @remarks
     * This method can be used for DRM-protected content. This method is more efficient than <a href="https://docs.microsoft.com/windows/desktop/api/mswmdm/nf-mswmdm-imdspobject-read">IMDSPObject::Read</a> because this method does not involve encrypting and decrypting parameters.
     * @param {Pointer<Integer>} pdwSize Pointer to a <b>DWORD</b> specifying the number of bytes of data to read. Upon return, this parameter contains the actual amount of data read.
     * @returns {Integer} Pointer to a buffer to receive the data read from the object.
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-imdspobject2-readonclearchannel
     */
    ReadOnClearChannel(pdwSize) {
        pdwSizeMarshal := pdwSize is VarRef ? "uint*" : "ptr"

        result := ComCall(11, this, "char*", &pData := 0, pdwSizeMarshal, pdwSize, "HRESULT")
        return pData
    }

    /**
     * The WriteOnClearChannel method writes data to the object to the current position within the object, without using secure authenticated channels.
     * @remarks
     * This method can be used with DRM-protected content. It is more efficient than <a href="https://docs.microsoft.com/windows/desktop/api/mswmdm/nf-mswmdm-imdspobject-write">IMDSPObject::Write</a> because this method does not involve encrypting and decrypting parameters.
     * 
     * Unlike <b>IMDSPObject::Write</b>, this method does not need to decrypt the data before writing to a device, and is therefore more efficient.
     * @param {Pointer<Integer>} pData Pointer to the buffer containing the data to write to the object.
     * @param {Pointer<Integer>} pdwSize Pointer to a <b>DWORD</b> containing the number of bytes of data to write. Upon return, this parameter contains the actual number of bytes written.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. All the interface methods in Windows Media Device Manager can return any of the following classes of error codes:
     * 
     * <ul>
     * <li>Standard COM error codes </li>
     * <li>Windows error codes converted to HRESULT values </li>
     * <li>Windows Media Device Manager error codes </li>
     * </ul>
     * For an extensive list of possible error codes, see <a href="https://docs.microsoft.com/windows/desktop/WMDM/error-codes">Error Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-imdspobject2-writeonclearchannel
     */
    WriteOnClearChannel(pData, pdwSize) {
        pDataMarshal := pData is VarRef ? "char*" : "ptr"
        pdwSizeMarshal := pdwSize is VarRef ? "uint*" : "ptr"

        result := ComCall(12, this, pDataMarshal, pData, pdwSizeMarshal, pdwSize, "HRESULT")
        return result
    }

    Query(iid) {
        if (IMDSPObject2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.ReadOnClearChannel := CallbackCreate(GetMethod(implObj, "ReadOnClearChannel"), flags, 3)
        this.vtbl.WriteOnClearChannel := CallbackCreate(GetMethod(implObj, "WriteOnClearChannel"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.ReadOnClearChannel)
        CallbackFree(this.vtbl.WriteOnClearChannel)
    }
}
