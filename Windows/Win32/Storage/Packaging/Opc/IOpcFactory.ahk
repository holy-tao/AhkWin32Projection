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
     * Creates an OPC URI object that represents the root of a package.
     * @returns {IOpcUri} A pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nn-msopc-iopcuri">IOpcUri</a> interface of the OPC URI object that represents the URI of the root of a package.
     * @see https://docs.microsoft.com/windows/win32/api//msopc/nf-msopc-iopcfactory-createpackagerooturi
     */
    CreatePackageRootUri() {
        result := ComCall(3, this, "ptr*", &rootUri := 0, "HRESULT")
        return IOpcUri(rootUri)
    }

    /**
     * Creates a part URI object that represents a part name.
     * @param {PWSTR} pwzUri A  URI that represents the location of a part relative to the root of the package that contains it.
     * @returns {IOpcPartUri} A pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nn-msopc-iopcparturi">IOpcPartUri</a> interface of the part URI object. This object represents the  part name derived from the URI passed in <i>pwzUri</i>.
     * 
     * Part names must conform to the syntax specified in the <i>OPC</i>.
     * @see https://docs.microsoft.com/windows/win32/api//msopc/nf-msopc-iopcfactory-createparturi
     */
    CreatePartUri(pwzUri) {
        pwzUri := pwzUri is String ? StrPtr(pwzUri) : pwzUri

        result := ComCall(4, this, "ptr", pwzUri, "ptr*", &partUri := 0, "HRESULT")
        return IOpcPartUri(partUri)
    }

    /**
     * Creates a stream over a file.
     * @param {PWSTR} filename The name of the file over which the stream is created.
     * @param {Integer} ioMode The value that describes the read/write status of the stream to be created.
     * @param {Pointer<SECURITY_ATTRIBUTES>} securityAttributes For information about the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa379560(v=vs.85)">SECURITY_ATTRIBUTES</a> structure in this parameter, see the <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-createfilea">CreateFile</a> function.
     * @param {Integer} dwFlagsAndAttributes The settings and attributes of the file. For most files, <b>FILE_ATTRIBUTE_NORMAL</b> can be used.
     * 
     * For more information about this parameter, see <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-createfilea">CreateFile</a>.
     * @returns {IStream} A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istream">IStream</a> interface of the stream.
     * @see https://docs.microsoft.com/windows/win32/api//msopc/nf-msopc-iopcfactory-createstreamonfile
     */
    CreateStreamOnFile(filename, ioMode, securityAttributes, dwFlagsAndAttributes) {
        filename := filename is String ? StrPtr(filename) : filename

        result := ComCall(5, this, "ptr", filename, "int", ioMode, "ptr", securityAttributes, "uint", dwFlagsAndAttributes, "ptr*", &stream := 0, "HRESULT")
        return IStream(stream)
    }

    /**
     * Creates a package object that represents an empty package.
     * @returns {IOpcPackage} A pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nn-msopc-iopcpackage">IOpcPackage</a> interface of the package object that represents an empty package.
     * @see https://docs.microsoft.com/windows/win32/api//msopc/nf-msopc-iopcfactory-createpackage
     */
    CreatePackage() {
        result := ComCall(6, this, "ptr*", &package := 0, "HRESULT")
        return IOpcPackage(package)
    }

    /**
     * Deserializes package data from a stream and creates a package object to represent the package being read.
     * @param {IStream} stream A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istream">IStream</a> interface of the stream.
     * 
     * The stream must be readable, seekable, have size,   and must contain package data. Additionally, if the stream is not clonable, it will be buffered and read sequentially, incurring overhead.
     * @param {Integer} flags The value that specifies the read settings for caching package components and validating them against <i>OPC</i> conformance requirements.
     * @returns {IOpcPackage} A pointer to the  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nn-msopc-iopcpackage">IOpcPackage</a> interface of the package object that represents the package being read through the stream.
     * @see https://docs.microsoft.com/windows/win32/api//msopc/nf-msopc-iopcfactory-readpackagefromstream
     */
    ReadPackageFromStream(stream, flags) {
        result := ComCall(7, this, "ptr", stream, "int", flags, "ptr*", &package := 0, "HRESULT")
        return IOpcPackage(package)
    }

    /**
     * Serializes a package that is represented by a package object.
     * @param {IOpcPackage} package A pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nn-msopc-iopcpackage">IOpcPackage</a> interface  of the package object that contains data to be serialized.
     * @param {Integer} flags The value that describes the encoding method  used in serialization.
     * @param {IStream} stream A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istream">IStream</a> interface of the stream where the package object  data will be written.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The value passed in the <i>flags</i> parameter is not a valid <a href="/windows/win32/api/msopc/ne-msopc-opc_write_flags">OPC_WRITE_FLAGS</a> enumeration value.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOTIMPL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This method is not implemented for this version of Windows.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * At least one of the <i>stream</i> and <i>package</i> parameters is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>IStream</b> interface error</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An <b>HRESULT</b> error code from the <a href="/windows/desktop/api/objidl/nn-objidl-istream">IStream</a> interface. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Package Consumption error</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An <b>HRESULT</b> error code from the <a href="/previous-versions/windows/desktop/opc/package-consumption-error-group">Package Consumption Error Group</a>. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Part URI error</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An <b>HRESULT</b> error code from the <a href="/previous-versions/windows/desktop/opc/part-uri-error-group">Part URI Error Group</a>. 
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//msopc/nf-msopc-iopcfactory-writepackagetostream
     */
    WritePackageToStream(package, flags, stream) {
        result := ComCall(8, this, "ptr", package, "int", flags, "ptr", stream, "HRESULT")
        return result
    }

    /**
     * Creates a digital signature manager object for a package object.
     * @param {IOpcPackage} package A pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nn-msopc-iopcpackage">IOpcPackage</a> interface of the package object to associate with the digital signature manager object.
     * @returns {IOpcDigitalSignatureManager} A pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nn-msopc-iopcdigitalsignaturemanager">IOpcDigitalSignatureManager</a> interface of the digital signature manager object that is created for use with the package object.
     * 
     * A digital signature manager object provides access to the Packaging API's digital signature interfaces and methods. These can be used to sign the package represented by the package object or to validate the signatures in a package that has already been signed.
     * @see https://docs.microsoft.com/windows/win32/api//msopc/nf-msopc-iopcfactory-createdigitalsignaturemanager
     */
    CreateDigitalSignatureManager(package) {
        result := ComCall(9, this, "ptr", package, "ptr*", &signatureManager := 0, "HRESULT")
        return IOpcDigitalSignatureManager(signatureManager)
    }
}
