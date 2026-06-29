#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IPortableDeviceContent.ahk" { IPortableDeviceContent }
#Import "..\..\System\Com\IStream.ahk" { IStream }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\IPortableDeviceValues.ahk" { IPortableDeviceValues }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * Defines additional methods that provide access to content found on a device.
 * @see https://learn.microsoft.com/windows/win32/api/portabledeviceapi/nn-portabledeviceapi-iportabledevicecontent2
 * @namespace Windows.Win32.Devices.PortableDevices
 */
export default struct IPortableDeviceContent2 extends IPortableDeviceContent {
    /**
     * The interface identifier for IPortableDeviceContent2
     * @type {Guid}
     */
    static IID := Guid("{9b4add96-f6bf-4034-8708-eca72bf10554}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IPortableDeviceContent2 interfaces
    */
    struct Vtbl extends IPortableDeviceContent.Vtbl {
        UpdateObjectWithPropertiesAndData : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IPortableDeviceContent2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Updates an object by using properties and data found on the device.
     * @remarks
     * Device formats and object formats can derive some of their object properties from the data itself. Or, they can  have property values  that depend on the data. For example, a music track has a duration property that is specified when an application calls the <a href="https://docs.microsoft.com/windows/desktop/api/portabledeviceapi/nf-portabledeviceapi-iportabledevicecontent-createobjectwithpropertiesanddata">IPortableDeviceContent::CreateObjectWithPropertiesAndData</a> method. If this track is stored as a default resource (<a href="https://docs.microsoft.com/windows/desktop/wpd_sdk/wpd-resource-default">WPD_RESOURCE_DEFAULT</a>), the application might update it. The application additionally mighthave to update the duration property. This method lets the application perform both updates at the same time.
     * 
     * An update is incomplete until the <b>IStream::Commit</b> method is called on the object referenced by the <i>ppData</i> parameter.
     * 
     * To abandon a data transfer in progress, an application should call the <b>IStream::Revert</b> method on the object referenced by the <i>ppData</i> parameter.
     * 
     * The <b>IStream</b> interface object referenced by the <i>ppData</i> parameter must be released after the update operation is complete, or, is canceled.
     * @param {PWSTR} pszObjectID The identifier of the object to update.
     * @param {IPortableDeviceValues} pProperties The <a href="https://docs.microsoft.com/windows/desktop/wpd_sdk/iportabledevicevalues">IPortableDeviceValues</a> interface that specifies the object properties to be updated.
     * @param {Pointer<Integer>} pdwOptimalWriteBufferSize The optimal buffer size for writing the object data to <i>ppData</i>, or <b>NULL</b> if the buffer size is ignored.
     * @returns {IStream} The <b>IStream</b> interface through which the object data is sent to the device.
     * @see https://learn.microsoft.com/windows/win32/api/portabledeviceapi/nf-portabledeviceapi-iportabledevicecontent2-updateobjectwithpropertiesanddata
     */
    UpdateObjectWithPropertiesAndData(pszObjectID, pProperties, pdwOptimalWriteBufferSize) {
        pszObjectID := pszObjectID is String ? StrPtr(pszObjectID) : pszObjectID

        pdwOptimalWriteBufferSizeMarshal := pdwOptimalWriteBufferSize is VarRef ? "uint*" : "ptr"

        result := ComCall(13, this, "ptr", pszObjectID, "ptr", pProperties, "ptr*", &ppData := 0, pdwOptimalWriteBufferSizeMarshal, pdwOptimalWriteBufferSize, "HRESULT")
        return IStream(ppData)
    }

    Query(iid) {
        if (IPortableDeviceContent2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.UpdateObjectWithPropertiesAndData := CallbackCreate(GetMethod(implObj, "UpdateObjectWithPropertiesAndData"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.UpdateObjectWithPropertiesAndData)
    }
}
