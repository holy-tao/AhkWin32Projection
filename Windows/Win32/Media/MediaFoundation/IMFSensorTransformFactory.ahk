#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMFAttributes.ahk
#Include .\IMFDeviceTransform.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The interface implemented by sensor transforms to allow the media pipeline to query requirements of the sensor transform and to create a runtime instance of the sensor transform.
 * @see https://docs.microsoft.com/windows/win32/api//mfidl/nn-mfidl-imfsensortransformfactory
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFSensorTransformFactory extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFSensorTransformFactory
     * @type {Guid}
     */
    static IID => Guid("{eed9c2ee-66b4-4f18-a697-ac7d3960215c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetFactoryAttributes", "InitializeFactory", "GetTransformCount", "GetTransformInformation", "CreateTransform"]

    /**
     * 
     * @returns {IMFAttributes} 
     */
    GetFactoryAttributes() {
        result := ComCall(3, this, "ptr*", &ppAttributes := 0, "HRESULT")
        return IMFAttributes(ppAttributes)
    }

    /**
     * 
     * @param {Integer} dwMaxTransformCount 
     * @param {IMFCollection} pSensorDevices 
     * @param {IMFAttributes} pAttributes 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfsensortransformfactory-initializefactory
     */
    InitializeFactory(dwMaxTransformCount, pSensorDevices, pAttributes) {
        result := ComCall(4, this, "uint", dwMaxTransformCount, "ptr", pSensorDevices, "ptr", pAttributes, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfsensortransformfactory-gettransformcount
     */
    GetTransformCount() {
        result := ComCall(5, this, "uint*", &pdwCount := 0, "HRESULT")
        return pdwCount
    }

    /**
     * 
     * @param {Integer} TransformIndex 
     * @param {Pointer<Guid>} pguidTransformId 
     * @param {Pointer<IMFAttributes>} ppAttributes 
     * @param {Pointer<IMFCollection>} ppStreamInformation 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfsensortransformfactory-gettransforminformation
     */
    GetTransformInformation(TransformIndex, pguidTransformId, ppAttributes, ppStreamInformation) {
        result := ComCall(6, this, "uint", TransformIndex, "ptr", pguidTransformId, "ptr*", ppAttributes, "ptr*", ppStreamInformation, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} guidSensorTransformID 
     * @param {IMFAttributes} pAttributes 
     * @returns {IMFDeviceTransform} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfsensortransformfactory-createtransform
     */
    CreateTransform(guidSensorTransformID, pAttributes) {
        result := ComCall(7, this, "ptr", guidSensorTransformID, "ptr", pAttributes, "ptr*", &ppDeviceMFT := 0, "HRESULT")
        return IMFDeviceTransform(ppDeviceMFT)
    }
}
