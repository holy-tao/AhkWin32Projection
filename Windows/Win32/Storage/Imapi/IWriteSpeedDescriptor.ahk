#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import ".\IMAPI_MEDIA_PHYSICAL_TYPE.ahk" { IMAPI_MEDIA_PHYSICAL_TYPE }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }

/**
 * Use this interface retrieve detailed write configurations supported by the disc recorder and current media, for example, the media type, write speed, rotational-speed control type.
 * @remarks
 * This is a <b>MsftWriteSpeedDescriptor</b> object in script.
 * @see https://learn.microsoft.com/windows/win32/api/imapi2/nn-imapi2-iwritespeeddescriptor
 * @namespace Windows.Win32.Storage.Imapi
 */
export default struct IWriteSpeedDescriptor extends IDispatch {
    /**
     * The interface identifier for IWriteSpeedDescriptor
     * @type {Guid}
     */
    static IID := Guid("{27354144-7f64-5b0f-8f00-5d77afbe261e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWriteSpeedDescriptor interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_MediaType             : IntPtr
        get_RotationTypeIsPureCAV : IntPtr
        get_WriteSpeed            : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWriteSpeedDescriptor.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {IMAPI_MEDIA_PHYSICAL_TYPE} 
     */
    MediaType {
        get => this.get_MediaType()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    RotationTypeIsPureCAV {
        get => this.get_RotationTypeIsPureCAV()
    }

    /**
     * @type {Integer} 
     */
    WriteSpeed {
        get => this.get_WriteSpeed()
    }

    /**
     * Retrieves type of media in the current drive.
     * @returns {IMAPI_MEDIA_PHYSICAL_TYPE} Type of media in the current drive. For possible values, see the <a href="https://docs.microsoft.com/windows/desktop/api/imapi2/ne-imapi2-imapi_media_physical_type">IMAPI_MEDIA_PHYSICAL_TYPE</a> enumeration type.
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-iwritespeeddescriptor-get_mediatype
     */
    get_MediaType() {
        result := ComCall(7, this, "int*", &value := 0, "HRESULT")
        return value
    }

    /**
     * Retrieves the supported rotational-speed control used by the recorder for the current media.
     * @remarks
     * Rotational-speed control types include the following:
     * 
     * <ul>
     * <li>	CLV (Constant Linear Velocity). The disc is written at a constant speed. Standard rotational control.</li>
     * <li>	CAV (Constant Angular Velocity). The disc is written at a constantly increasing speed.</li>
     * <li>	ZCAV (Zone Constant Linear Velocity). The disc is divided into zones. After each zone, the write speed increases. This is an impure form of CAV.</li>
     * <li>	PCAV (Partial Constant Angular Velocity). The disc speed increases up to a specified velocity. Once reached, the disc spins at the specified velocity for the duration of the disc writing.</li>
     * </ul>
     * @returns {VARIANT_BOOL} Is VARIANT_TRUE if constant angular velocity (CAV)  rotational-speed control is in use. Otherwise, VARIANT_FALSE to indicate that another rotational-speed control that the recorder supports is in use.
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-iwritespeeddescriptor-get_rotationtypeispurecav
     */
    get_RotationTypeIsPureCAV() {
        result := ComCall(8, this, VARIANT_BOOL.Ptr, &value := 0, "HRESULT")
        return value
    }

    /**
     * Retrieves the supported write speed for writing to the media.
     * @remarks
     * The write speed is based on the media write speeds. The value of this property can change when a media change occurs.
     * @returns {Integer} Write speed of the current media, measured in sectors per second.
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-iwritespeeddescriptor-get_writespeed
     */
    get_WriteSpeed() {
        result := ComCall(9, this, "int*", &value := 0, "HRESULT")
        return value
    }

    Query(iid) {
        if (IWriteSpeedDescriptor.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_MediaType := CallbackCreate(GetMethod(implObj, "get_MediaType"), flags, 2)
        this.vtbl.get_RotationTypeIsPureCAV := CallbackCreate(GetMethod(implObj, "get_RotationTypeIsPureCAV"), flags, 2)
        this.vtbl.get_WriteSpeed := CallbackCreate(GetMethod(implObj, "get_WriteSpeed"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_MediaType)
        CallbackFree(this.vtbl.get_RotationTypeIsPureCAV)
        CallbackFree(this.vtbl.get_WriteSpeed)
    }
}
