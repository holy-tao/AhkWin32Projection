#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IStream.ahk
#Include .\IPortableDeviceContent.ahk

/**
 * Defines additional methods that provide access to content found on a device.
 * @see https://learn.microsoft.com/windows/win32/api//content/portabledeviceapi/nn-portabledeviceapi-iportabledevicecontent2
 * @namespace Windows.Win32.Devices.PortableDevices
 * @version v4.0.30319
 */
class IPortableDeviceContent2 extends IPortableDeviceContent{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPortableDeviceContent2
     * @type {Guid}
     */
    static IID => Guid("{9b4add96-f6bf-4034-8708-eca72bf10554}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 13

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["UpdateObjectWithPropertiesAndData"]

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
     * @see https://learn.microsoft.com/windows/win32/api//content/portabledeviceapi/nf-portabledeviceapi-iportabledevicecontent2-updateobjectwithpropertiesanddata
     */
    UpdateObjectWithPropertiesAndData(pszObjectID, pProperties, pdwOptimalWriteBufferSize) {
        pszObjectID := pszObjectID is String ? StrPtr(pszObjectID) : pszObjectID

        pdwOptimalWriteBufferSizeMarshal := pdwOptimalWriteBufferSize is VarRef ? "uint*" : "ptr"

        result := ComCall(13, this, "ptr", pszObjectID, "ptr", pProperties, "ptr*", &ppData := 0, pdwOptimalWriteBufferSizeMarshal, pdwOptimalWriteBufferSize, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IStream(ppData)
    }
}
