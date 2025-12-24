#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Variant\VARIANT.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The IFaxDeviceProvider interface defines a configuration object used by a fax client application to retrieve information about a fax service provider (FSP) registered with the fax service.
 * @remarks
 * 
 * A default implementation of <b>IFaxDeviceProvider</b> is provided as the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxdeviceprovider">FaxDeviceProvider</a> object.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nn-faxcomex-ifaxdeviceprovider
 * @namespace Windows.Win32.Devices.Fax
 * @version v4.0.30319
 */
class IFaxDeviceProvider extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFaxDeviceProvider
     * @type {Guid}
     */
    static IID => Guid("{290eac63-83ec-449c-8417-f148df8c682a}")

    /**
     * The class identifier for FaxDeviceProvider
     * @type {Guid}
     */
    static CLSID => Guid("{17cf1aa3-f5eb-484a-9c9a-4440a5baabfc}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_FriendlyName", "get_ImageName", "get_UniqueName", "get_TapiProviderName", "get_MajorVersion", "get_MinorVersion", "get_MajorBuild", "get_MinorBuild", "get_Debug", "get_Status", "get_InitErrorCode", "get_DeviceIds"]

    /**
     * @type {BSTR} 
     */
    FriendlyName {
        get => this.get_FriendlyName()
    }

    /**
     * @type {BSTR} 
     */
    ImageName {
        get => this.get_ImageName()
    }

    /**
     * @type {BSTR} 
     */
    UniqueName {
        get => this.get_UniqueName()
    }

    /**
     * @type {BSTR} 
     */
    TapiProviderName {
        get => this.get_TapiProviderName()
    }

    /**
     * @type {Integer} 
     */
    MajorVersion {
        get => this.get_MajorVersion()
    }

    /**
     * @type {Integer} 
     */
    MinorVersion {
        get => this.get_MinorVersion()
    }

    /**
     * @type {Integer} 
     */
    MajorBuild {
        get => this.get_MajorBuild()
    }

    /**
     * @type {Integer} 
     */
    MinorBuild {
        get => this.get_MinorBuild()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    Debug {
        get => this.get_Debug()
    }

    /**
     * @type {Integer} 
     */
    Status {
        get => this.get_Status()
    }

    /**
     * @type {Integer} 
     */
    InitErrorCode {
        get => this.get_InitErrorCode()
    }

    /**
     * @type {VARIANT} 
     */
    DeviceIds {
        get => this.get_DeviceIds()
    }

    /**
     * The IFaxDeviceProvider::get_FriendlyName property is a null-terminated string that contains the user-friendly name for the fax service provider (FSP). This string is suitable for display to users.
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxdeviceprovider-get_friendlyname
     */
    get_FriendlyName() {
        pbstrFriendlyName := BSTR()
        result := ComCall(7, this, "ptr", pbstrFriendlyName, "HRESULT")
        return pbstrFriendlyName
    }

    /**
     * The IFaxDeviceProvider::get_ImageName property is a null-terminated string that contains the executable image name (DLL path and file name) of the fax service provider (FSP).
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxdeviceprovider-get_imagename
     */
    get_ImageName() {
        pbstrImageName := BSTR()
        result := ComCall(8, this, "ptr", pbstrImageName, "HRESULT")
        return pbstrImageName
    }

    /**
     * The IFaxDeviceProvider::get_UniqueName property is a null-terminated string that contains the unique name that identifies the fax service provider (FSP).
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxdeviceprovider-get_uniquename
     */
    get_UniqueName() {
        pbstrUniqueName := BSTR()
        result := ComCall(9, this, "ptr", pbstrUniqueName, "HRESULT")
        return pbstrUniqueName
    }

    /**
     * The IFaxDeviceProvider::get_TapiProviderName property is a null-terminated string that contains the name of the telephony service provider (TSP) associated with the fax service provider (FSP) fax devices.
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxdeviceprovider-get_tapiprovidername
     */
    get_TapiProviderName() {
        pbstrTapiProviderName := BSTR()
        result := ComCall(10, this, "ptr", pbstrTapiProviderName, "HRESULT")
        return pbstrTapiProviderName
    }

    /**
     * The IFaxDeviceProvider::get_MajorVersion property is a value that specifies the major part of the version number for the fax service provider (FSP)Â DLL.
     * @remarks
     * 
     * The standard format for version numbers is MajorVersion.MinorVersion.MajorBuild.MinorBuild.
     * 
     * 
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxdeviceprovider-get_majorversion
     */
    get_MajorVersion() {
        result := ComCall(11, this, "int*", &plMajorVersion := 0, "HRESULT")
        return plMajorVersion
    }

    /**
     * The IFaxDeviceProvider::get_MinorVersion property is a value that specifies the minor part of the version number for the fax service provider (FSP)Â DLL.
     * @remarks
     * 
     * The standard format for version numbers is MajorVersion.MinorVersion.MajorBuild.MinorBuild.
     * 
     * 
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxdeviceprovider-get_minorversion
     */
    get_MinorVersion() {
        result := ComCall(12, this, "int*", &plMinorVersion := 0, "HRESULT")
        return plMinorVersion
    }

    /**
     * The IFaxDeviceProvider::get_MajorBuild property is a value that specifies the major part of the build number for the fax service provider (FSP)Â DLL.
     * @remarks
     * 
     * The standard format for build numbers is MajorVersion.MinorVersion.MajorBuild.MinorBuild.
     * 
     * 
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxdeviceprovider-get_majorbuild
     */
    get_MajorBuild() {
        result := ComCall(13, this, "int*", &plMajorBuild := 0, "HRESULT")
        return plMajorBuild
    }

    /**
     * The IFaxDeviceProvider::get_MinorBuild property is a value that specifies the minor part of the build number for the fax service provider (FSP)Â DLL.
     * @remarks
     * 
     * The standard format for build numbers is MajorVersion.MinorVersion.MajorBuild.MinorBuild.
     * 
     * 
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxdeviceprovider-get_minorbuild
     */
    get_MinorBuild() {
        result := ComCall(14, this, "int*", &plMinorBuild := 0, "HRESULT")
        return plMinorBuild
    }

    /**
     * The IFaxDeviceProvider::get_Debug property is a Boolean value that indicates whether the fax service provider (FSP)Â DLL was created in a debug environment.
     * @remarks
     * 
     * If this property is equal to <b>TRUE</b>, the FSPÂ DLL was created in a debug environment. If this property is equal to <b>FALSE</b>, the DLL was not created in a debug environment.
     * 
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxdeviceprovider-get_debug
     */
    get_Debug() {
        result := ComCall(15, this, "short*", &pbDebug := 0, "HRESULT")
        return pbDebug
    }

    /**
     * The IFaxDeviceProvider::get_Status property is a number that indicates whether the fax service provider (FSP) loaded and initialized successfully.
     * @remarks
     * 
     * If the FSP did not load successfully, the property indicates the reason for the failure, and <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxdeviceprovider-initerrorcode-vb">IFaxDeviceProvider::get_InitErrorCode</a> holds the last error code value. For more information, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_provider_status_enum">FAX_PROVIDER_STATUS_ENUM</a>.
     * 
     * 
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxdeviceprovider-get_status
     */
    get_Status() {
        result := ComCall(16, this, "int*", &pStatus := 0, "HRESULT")
        return pStatus
    }

    /**
     * The IFaxDeviceProvider::get_InitErrorCode property is a value that specifies the last error code that the fax service provider (FSP) returned while the fax service was loading and initializing the FSPÂ DLL.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxdeviceprovider-get_initerrorcode
     */
    get_InitErrorCode() {
        result := ComCall(17, this, "int*", &plInitErrorCode := 0, "HRESULT")
        return plInitErrorCode
    }

    /**
     * The IFaxDeviceProvider::get_DeviceIds property returns a variant safe array of long (VT_I4 | VT_ARRAY). Each long value in the array is a device ID.
     * @returns {VARIANT} 
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxdeviceprovider-get_deviceids
     */
    get_DeviceIds() {
        pvDeviceIds := VARIANT()
        result := ComCall(18, this, "ptr", pvDeviceIds, "HRESULT")
        return pvDeviceIds
    }
}
