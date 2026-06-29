#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IMFCollection.ahk" { IMFCollection }
#Import ".\IMFDeviceTransform.ahk" { IMFDeviceTransform }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IMFAttributes.ahk" { IMFAttributes }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The interface implemented by sensor transforms to allow the media pipeline to query requirements of the sensor transform and to create a runtime instance of the sensor transform.
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/nn-mfidl-imfsensortransformfactory
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct IMFSensorTransformFactory extends IUnknown {
    /**
     * The interface identifier for IMFSensorTransformFactory
     * @type {Guid}
     */
    static IID := Guid("{eed9c2ee-66b4-4f18-a697-ac7d3960215c}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMFSensorTransformFactory interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetFactoryAttributes    : IntPtr
        InitializeFactory       : IntPtr
        GetTransformCount       : IntPtr
        GetTransformInformation : IntPtr
        CreateTransform         : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMFSensorTransformFactory.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfsensortransformfactory-initializefactory
     */
    InitializeFactory(dwMaxTransformCount, pSensorDevices, pAttributes) {
        result := ComCall(4, this, "uint", dwMaxTransformCount, "ptr", pSensorDevices, "ptr", pAttributes, "HRESULT")
        return result
    }

    /**
     * Called by the media pipeline to get the number of transforms provided by the sensor transform.
     * @remarks
     * In the current release, chaining of transforms is not supported, so this value should always be 1.
     * @returns {Integer} The number of transforms provided by the sensor transform.
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfsensortransformfactory-gettransformcount
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
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfsensortransformfactory-gettransforminformation
     */
    GetTransformInformation(TransformIndex, pguidTransformId, ppAttributes, ppStreamInformation) {
        result := ComCall(6, this, "uint", TransformIndex, Guid.Ptr, pguidTransformId, IMFAttributes.Ptr, ppAttributes, IMFCollection.Ptr, ppStreamInformation, "HRESULT")
        return result
    }

    /**
     * Called by the media pipeline to create the transform.
     * @param {Pointer<Guid>} guidSensorTransformID The identifier of the transform to be created.
     * @param {IMFAttributes} pAttributes The identifier of the transform to be created.
     * @returns {IMFDeviceTransform} The identifier of the transform to be created.
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfsensortransformfactory-createtransform
     */
    CreateTransform(guidSensorTransformID, pAttributes) {
        result := ComCall(7, this, Guid.Ptr, guidSensorTransformID, "ptr", pAttributes, "ptr*", &ppDeviceMFT := 0, "HRESULT")
        return IMFDeviceTransform(ppDeviceMFT)
    }

    Query(iid) {
        if (IMFSensorTransformFactory.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetFactoryAttributes := CallbackCreate(GetMethod(implObj, "GetFactoryAttributes"), flags, 2)
        this.vtbl.InitializeFactory := CallbackCreate(GetMethod(implObj, "InitializeFactory"), flags, 4)
        this.vtbl.GetTransformCount := CallbackCreate(GetMethod(implObj, "GetTransformCount"), flags, 2)
        this.vtbl.GetTransformInformation := CallbackCreate(GetMethod(implObj, "GetTransformInformation"), flags, 5)
        this.vtbl.CreateTransform := CallbackCreate(GetMethod(implObj, "CreateTransform"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetFactoryAttributes)
        CallbackFree(this.vtbl.InitializeFactory)
        CallbackFree(this.vtbl.GetTransformCount)
        CallbackFree(this.vtbl.GetTransformInformation)
        CallbackFree(this.vtbl.CreateTransform)
    }
}
