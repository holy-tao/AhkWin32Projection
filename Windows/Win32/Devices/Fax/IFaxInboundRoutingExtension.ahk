#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Variant\VARIANT.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The IFaxInboundRoutingExtension interface defines a configuration object used by a fax client application to retrieve information about a fax routing extension registered with the fax service.
 * @remarks
 * 
 * A default implementation of <b>IFaxInboundRoutingExtension</b> is provided as the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxinboundroutingextension">FaxInboundRoutingExtension</a> object.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nn-faxcomex-ifaxinboundroutingextension
 * @namespace Windows.Win32.Devices.Fax
 * @version v4.0.30319
 */
class IFaxInboundRoutingExtension extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFaxInboundRoutingExtension
     * @type {Guid}
     */
    static IID => Guid("{885b5e08-c26c-4ef9-af83-51580a750be1}")

    /**
     * The class identifier for FaxInboundRoutingExtension
     * @type {Guid}
     */
    static CLSID => Guid("{1d7dfb51-7207-4436-a0d9-24e32ee56988}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_FriendlyName", "get_ImageName", "get_UniqueName", "get_MajorVersion", "get_MinorVersion", "get_MajorBuild", "get_MinorBuild", "get_Debug", "get_Status", "get_InitErrorCode", "get_Methods"]

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
    Methods {
        get => this.get_Methods()
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxinboundroutingextension-get_friendlyname
     */
    get_FriendlyName() {
        pbstrFriendlyName := BSTR()
        result := ComCall(7, this, "ptr", pbstrFriendlyName, "HRESULT")
        return pbstrFriendlyName
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxinboundroutingextension-get_imagename
     */
    get_ImageName() {
        pbstrImageName := BSTR()
        result := ComCall(8, this, "ptr", pbstrImageName, "HRESULT")
        return pbstrImageName
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxinboundroutingextension-get_uniquename
     */
    get_UniqueName() {
        pbstrUniqueName := BSTR()
        result := ComCall(9, this, "ptr", pbstrUniqueName, "HRESULT")
        return pbstrUniqueName
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxinboundroutingextension-get_majorversion
     */
    get_MajorVersion() {
        result := ComCall(10, this, "int*", &plMajorVersion := 0, "HRESULT")
        return plMajorVersion
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxinboundroutingextension-get_minorversion
     */
    get_MinorVersion() {
        result := ComCall(11, this, "int*", &plMinorVersion := 0, "HRESULT")
        return plMinorVersion
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxinboundroutingextension-get_majorbuild
     */
    get_MajorBuild() {
        result := ComCall(12, this, "int*", &plMajorBuild := 0, "HRESULT")
        return plMajorBuild
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxinboundroutingextension-get_minorbuild
     */
    get_MinorBuild() {
        result := ComCall(13, this, "int*", &plMinorBuild := 0, "HRESULT")
        return plMinorBuild
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxinboundroutingextension-get_debug
     */
    get_Debug() {
        result := ComCall(14, this, "short*", &pbDebug := 0, "HRESULT")
        return pbDebug
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxinboundroutingextension-get_status
     */
    get_Status() {
        result := ComCall(15, this, "int*", &pStatus := 0, "HRESULT")
        return pStatus
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxinboundroutingextension-get_initerrorcode
     */
    get_InitErrorCode() {
        result := ComCall(16, this, "int*", &plInitErrorCode := 0, "HRESULT")
        return plInitErrorCode
    }

    /**
     * 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxinboundroutingextension-get_methods
     */
    get_Methods() {
        pvMethods := VARIANT()
        result := ComCall(17, this, "ptr", pvMethods, "HRESULT")
        return pvMethods
    }
}
