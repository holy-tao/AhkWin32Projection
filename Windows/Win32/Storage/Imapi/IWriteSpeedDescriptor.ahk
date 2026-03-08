#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * Use this interface retrieve detailed write configurations supported by the disc recorder and current media, for example, the media type, write speed, rotational-speed control type.
 * @remarks
 * This is a <b>MsftWriteSpeedDescriptor</b> object in script.
 * @see https://learn.microsoft.com/windows/win32/api/imapi2/nn-imapi2-iwritespeeddescriptor
 * @namespace Windows.Win32.Storage.Imapi
 * @version v4.0.30319
 */
class IWriteSpeedDescriptor extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWriteSpeedDescriptor
     * @type {Guid}
     */
    static IID => Guid("{27354144-7f64-5b0f-8f00-5d77afbe261e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_MediaType", "get_RotationTypeIsPureCAV", "get_WriteSpeed"]

    /**
     * @type {Integer} 
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
     * @returns {Integer} Type of media in the current drive. For possible values, see the <a href="https://docs.microsoft.com/windows/desktop/api/imapi2/ne-imapi2-imapi_media_physical_type">IMAPI_MEDIA_PHYSICAL_TYPE</a> enumeration type.
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
        result := ComCall(8, this, "short*", &value := 0, "HRESULT")
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
}
