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
     * Called by the media pipeline to initialize the sensor transform.
     * @param {Integer} dwMaxTransformCount The maximum number of transforms allowed in a single transform. In the current release, this is always 1.
     * @param {IMFCollection} pSensorDevices A collection of <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfsensordevice">IMFSensorDevice</a> objects representing the available sensors.
     * @param {IMFAttributes} pAttributes The attribute store to be populated by the sensor transform. The only required attribute for sensor transforms is <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-stf-version-info">MF_STF_VERSION_INFO</a>.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imfsensortransformfactory-initializefactory
     */
    InitializeFactory(dwMaxTransformCount, pSensorDevices, pAttributes) {
        result := ComCall(4, this, "uint", dwMaxTransformCount, "ptr", pSensorDevices, "ptr", pAttributes, "HRESULT")
        return result
    }

    /**
     * Called by the media pipeline to get the number of transforms provided by the sensor transform.
     * @returns {Integer} The number of transforms provided by the sensor transform.
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imfsensortransformfactory-gettransformcount
     */
    GetTransformCount() {
        result := ComCall(5, this, "uint*", &pdwCount := 0, "HRESULT")
        return pdwCount
    }

    /**
     * Called by the media pipeline to get information about a transform provided by the sensor transform.
     * @param {Integer} TransformIndex The index of the transform for which information is being requested. In the current release, this value will always be 0.
     * @param {Pointer<Guid>} pguidTransformId Gets the identifier for the transform.
     * @param {Pointer<IMFAttributes>} ppAttributes The attribute store to be populated.
     * @param {Pointer<IMFCollection>} ppStreamInformation A collection of <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfsensorstream">IMFSensorStream</a> objects.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imfsensortransformfactory-gettransforminformation
     */
    GetTransformInformation(TransformIndex, pguidTransformId, ppAttributes, ppStreamInformation) {
        result := ComCall(6, this, "uint", TransformIndex, "ptr", pguidTransformId, "ptr*", ppAttributes, "ptr*", ppStreamInformation, "HRESULT")
        return result
    }

    /**
     * Called by the media pipeline to create the transform.
     * @param {Pointer<Guid>} guidSensorTransformID The identifier of the transform to be created.
     * @param {IMFAttributes} pAttributes The identifier of the transform to be created.
     * @returns {IMFDeviceTransform} The identifier of the transform to be created.
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imfsensortransformfactory-createtransform
     */
    CreateTransform(guidSensorTransformID, pAttributes) {
        result := ComCall(7, this, "ptr", guidSensorTransformID, "ptr", pAttributes, "ptr*", &ppDeviceMFT := 0, "HRESULT")
        return IMFDeviceTransform(ppDeviceMFT)
    }
}
