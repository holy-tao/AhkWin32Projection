#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IOpcUri.ahk
#Include .\IOpcPartUri.ahk
#Include ..\..\..\System\Com\IStream.ahk
#Include .\IOpcPackage.ahk
#Include .\IOpcDigitalSignatureManager.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Creates Packaging API objects and provides support for saving and loading packages.
 * @remarks
 * 
 * Do not use a stream to serialize package data when the same stream is being used to deserialize a package; attempting to do so may result in undefined behavior.
 * 
 * To use the Packaging API, the package must map to a ZIP archive as specified in the <i>ECMA-376 OpenXML, 1st Edition, Part 2: Open Packaging Conventions (OPC)</i>.
 * 
 * To create a factory that implements the <b>IOpcFactory</b> interface,  call the <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cocreateinstance">CoCreateInstance</a> function. This factory is not tied to any particular package or Packaging API object, and it can be used for the lifetime of the application. For example code that shows how to create a factory implementing  <b>IOpcFactory</b>, see the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/opc/packaging-api-overview">Getting Started with the Packaging API</a>.
 * 
 * <h3><a id="IOpcFactory_Support_on_Previous_Versions_of_Windows"></a><a id="iopcfactory_support_on_previous_versions_of_windows"></a><a id="IOPCFACTORY_SUPPORT_ON_PREVIOUS_VERSIONS_OF_WINDOWS"></a>IOpcFactory Support on Previous Versions of Windows</h3>
 * If an application attempts to an unsupported <b>IOpcFactory</b> method, the E_NOTIMPL error code will be returned. For more information, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/opc/packaging-api-overview">Getting Started with the Packaging API</a>, and <a href="https://docs.microsoft.com/windows/desktop/win7ip/platform-update-for-windows-vista-portal">Platform Update for Windows Vista</a>.
 * 
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//msopc/nn-msopc-iopcfactory
 * @namespace Windows.Win32.Storage.Packaging.Opc
 * @version v4.0.30319
 */
class IOpcFactory extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IOpcFactory
     * @type {Guid}
     */
    static IID => Guid("{6d0b4446-cd73-4ab3-94f4-8ccdf6116154}")

    /**
     * The class identifier for OpcFactory
     * @type {Guid}
     */
    static CLSID => Guid("{6b2d6ba0-9f3e-4f27-920b-313cc426a39e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreatePackageRootUri", "CreatePartUri", "CreateStreamOnFile", "CreatePackage", "ReadPackageFromStream", "WritePackageToStream", "CreateDigitalSignatureManager"]

    /**
     * 
     * @returns {IOpcUri} 
     * @see https://learn.microsoft.com/windows/win32/api/msopc/nf-msopc-iopcfactory-createpackagerooturi
     */
    CreatePackageRootUri() {
        result := ComCall(3, this, "ptr*", &rootUri := 0, "HRESULT")
        return IOpcUri(rootUri)
    }

    /**
     * 
     * @param {PWSTR} pwzUri 
     * @returns {IOpcPartUri} 
     * @see https://learn.microsoft.com/windows/win32/api/msopc/nf-msopc-iopcfactory-createparturi
     */
    CreatePartUri(pwzUri) {
        pwzUri := pwzUri is String ? StrPtr(pwzUri) : pwzUri

        result := ComCall(4, this, "ptr", pwzUri, "ptr*", &partUri := 0, "HRESULT")
        return IOpcPartUri(partUri)
    }

    /**
     * 
     * @param {PWSTR} filename 
     * @param {Integer} ioMode 
     * @param {Pointer<SECURITY_ATTRIBUTES>} securityAttributes 
     * @param {Integer} dwFlagsAndAttributes 
     * @returns {IStream} 
     * @see https://learn.microsoft.com/windows/win32/api/msopc/nf-msopc-iopcfactory-createstreamonfile
     */
    CreateStreamOnFile(filename, ioMode, securityAttributes, dwFlagsAndAttributes) {
        filename := filename is String ? StrPtr(filename) : filename

        result := ComCall(5, this, "ptr", filename, "int", ioMode, "ptr", securityAttributes, "uint", dwFlagsAndAttributes, "ptr*", &stream := 0, "HRESULT")
        return IStream(stream)
    }

    /**
     * 
     * @returns {IOpcPackage} 
     * @see https://learn.microsoft.com/windows/win32/api/msopc/nf-msopc-iopcfactory-createpackage
     */
    CreatePackage() {
        result := ComCall(6, this, "ptr*", &package := 0, "HRESULT")
        return IOpcPackage(package)
    }

    /**
     * 
     * @param {IStream} stream 
     * @param {Integer} flags 
     * @returns {IOpcPackage} 
     * @see https://learn.microsoft.com/windows/win32/api/msopc/nf-msopc-iopcfactory-readpackagefromstream
     */
    ReadPackageFromStream(stream, flags) {
        result := ComCall(7, this, "ptr", stream, "int", flags, "ptr*", &package := 0, "HRESULT")
        return IOpcPackage(package)
    }

    /**
     * 
     * @param {IOpcPackage} package 
     * @param {Integer} flags 
     * @param {IStream} stream 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msopc/nf-msopc-iopcfactory-writepackagetostream
     */
    WritePackageToStream(package, flags, stream) {
        result := ComCall(8, this, "ptr", package, "int", flags, "ptr", stream, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IOpcPackage} package 
     * @returns {IOpcDigitalSignatureManager} 
     * @see https://learn.microsoft.com/windows/win32/api/msopc/nf-msopc-iopcfactory-createdigitalsignaturemanager
     */
    CreateDigitalSignatureManager(package) {
        result := ComCall(9, this, "ptr", package, "ptr*", &signatureManager := 0, "HRESULT")
        return IOpcDigitalSignatureManager(signatureManager)
    }
}
