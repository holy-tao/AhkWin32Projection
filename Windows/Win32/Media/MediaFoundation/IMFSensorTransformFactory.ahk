#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * @param {Pointer<IMFAttributes>} ppAttributes 
     * @returns {HRESULT} 
     */
    GetFactoryAttributes(ppAttributes) {
        result := ComCall(3, this, "ptr*", ppAttributes, "HRESULT")
        return result
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
     * @param {Pointer<Integer>} pdwCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfsensortransformfactory-gettransformcount
     */
    GetTransformCount(pdwCount) {
        result := ComCall(5, this, "uint*", pdwCount, "HRESULT")
        return result
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
     * @param {Pointer<IMFDeviceTransform>} ppDeviceMFT 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfsensortransformfactory-createtransform
     */
    CreateTransform(guidSensorTransformID, pAttributes, ppDeviceMFT) {
        result := ComCall(7, this, "ptr", guidSensorTransformID, "ptr", pAttributes, "ptr*", ppDeviceMFT, "HRESULT")
        return result
    }
}
