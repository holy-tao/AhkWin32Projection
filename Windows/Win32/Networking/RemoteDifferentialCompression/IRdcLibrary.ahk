#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IRdcGeneratorParameters.ahk
#Include .\IRdcGenerator.ahk
#Include .\IRdcComparator.ahk
#Include .\IRdcSignatureReader.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Is the primary interface for using RDC.
 * @see https://docs.microsoft.com/windows/win32/api//msrdc/nn-msrdc-irdclibrary
 * @namespace Windows.Win32.Networking.RemoteDifferentialCompression
 * @version v4.0.30319
 */
class IRdcLibrary extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRdcLibrary
     * @type {Guid}
     */
    static IID => Guid("{96236a78-9dbc-11da-9e3f-0011114ae311}")

    /**
     * The class identifier for RdcLibrary
     * @type {Guid}
     */
    static CLSID => Guid("{96236a85-9dbc-11da-9e3f-0011114ae311}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ComputeDefaultRecursionDepth", "CreateGeneratorParameters", "OpenGeneratorParameters", "CreateGenerator", "CreateComparator", "CreateSignatureReader", "GetRDCVersion"]

    /**
     * Computes the maximum level of recursion for the specified file size.
     * @param {Integer} fileSize The approximate size of the file.
     * @returns {Integer} Pointer to a <b>ULONG</b> that will receive the suggested maximum recursion 
     *     depth.
     * @see https://docs.microsoft.com/windows/win32/api//msrdc/nf-msrdc-irdclibrary-computedefaultrecursiondepth
     */
    ComputeDefaultRecursionDepth(fileSize) {
        result := ComCall(3, this, "uint", fileSize, "uint*", &depth := 0, "HRESULT")
        return depth
    }

    /**
     * Returns an IRdcGeneratorParameters interface pointer initialized with the parameters necessary for a signature generator.
     * @param {Integer} parametersType Specifies the type of signature generator for the created parameters, enumerated by the 
     *     <a href="https://docs.microsoft.com/windows/win32/api/msrdc/ne-msrdc-generatorparameterstype">GeneratorParametersType</a> enumeration. The initial 
     *   release of RDC only supports one type, <b>RDCGENTYPE_FilterMax</b>.
     * @param {Integer} level The recursion level for this parameter block. A parameter block is needed for each level of generated 
     *     signatures. The valid range is from <b>MSRDC_MINIMUM_DEPTH</b> to 
     *   <b>MSRDC_MAXIMUM_DEPTH</b>.
     * @returns {IRdcGeneratorParameters} Pointer to a location that will receive an 
     *     <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msrdc/nn-msrdc-irdcgeneratorparameters">IRdcGeneratorParameters</a> interface pointer. On a 
     *   successful return the interface will be initialized on return. Callers must release the interface.
     * @see https://docs.microsoft.com/windows/win32/api//msrdc/nf-msrdc-irdclibrary-creategeneratorparameters
     */
    CreateGeneratorParameters(parametersType, level) {
        result := ComCall(4, this, "int", parametersType, "uint", level, "ptr*", &iGeneratorParameters := 0, "HRESULT")
        return IRdcGeneratorParameters(iGeneratorParameters)
    }

    /**
     * Opens an existing serialized parameter block and returns an IRdcGeneratorParameters interface pointer initialized with the data.
     * @param {Integer} size The size, in bytes, of the serialized parameter block.
     * @param {Pointer<Integer>} parametersBlob Pointer to a serialized parameter block.
     * @returns {IRdcGeneratorParameters} Pointer to a location that will receive the returned 
     *     <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msrdc/nn-msrdc-irdcgeneratorparameters">IRdcGeneratorParameters</a> interface pointer. Callers 
     *   must release the interface.
     * @see https://docs.microsoft.com/windows/win32/api//msrdc/nf-msrdc-irdclibrary-opengeneratorparameters
     */
    OpenGeneratorParameters(size, parametersBlob) {
        parametersBlobMarshal := parametersBlob is VarRef ? "char*" : "ptr"

        result := ComCall(5, this, "uint", size, parametersBlobMarshal, parametersBlob, "ptr*", &iGeneratorParameters := 0, "HRESULT")
        return IRdcGeneratorParameters(iGeneratorParameters)
    }

    /**
     * Creates a signature generator that will generate the specified levels of signatures.
     * @param {Integer} depth The number of levels of signatures to generate. The valid range is from 
     *     <b>MSRDC_MINIMUM_DEPTH</b> to <b>MSRDC_MAXIMUM_DEPTH</b>.
     * @param {Pointer<IRdcGeneratorParameters>} iGeneratorParametersArray Pointer to an array of initialized 
     *     <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msrdc/nn-msrdc-irdcgeneratorparameters">IRdcGeneratorParameters</a> interface pointers. Each 
     *     <b>IRdcGeneratorParameters</b> interface pointer would 
     *     have been initialized by 
     *     <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msrdc/nf-msrdc-irdclibrary-creategeneratorparameters">IRdcLibrary::CreateGeneratorParameters</a> or 
     *     <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msrdc/nf-msrdc-irdcgenerator-getgeneratorparameters">IRdcGenerator::GetGeneratorParameters</a>.
     * @returns {IRdcGenerator} Pointer to a location that will receive the returned 
     *       <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msrdc/nn-msrdc-irdcgenerator">IRdcGenerator</a> interface pointer. Callers must release the 
     *       interface.
     * @see https://docs.microsoft.com/windows/win32/api//msrdc/nf-msrdc-irdclibrary-creategenerator
     */
    CreateGenerator(depth, iGeneratorParametersArray) {
        result := ComCall(6, this, "uint", depth, "ptr*", iGeneratorParametersArray, "ptr*", &iGenerator := 0, "HRESULT")
        return IRdcGenerator(iGenerator)
    }

    /**
     * Creates a signature comparator.
     * @param {IRdcFileReader} iSeedSignaturesFile An <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msrdc/nn-msrdc-irdcfilereader">IRdcFileReader</a> interface pointer initialized to 
     *       read the seed signatures.
     * @param {Integer} comparatorBufferSize Specifies the size of the comparator buffer. The range is from 
     *       <b>MSRDC_MINIMUM_COMPAREBUFFER</b> to 
     *       <b>MSRDC_MAXIMUM_COMPAREBUFFER</b>.
     * @returns {IRdcComparator} Pointer to a location that will receive an 
     *       <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msrdc/nn-msrdc-irdccomparator">IRdcComparator</a> interface pointer. On a successful return 
     *       the interface will be initialized on return. Callers must release the interface.
     * @see https://docs.microsoft.com/windows/win32/api//msrdc/nf-msrdc-irdclibrary-createcomparator
     */
    CreateComparator(iSeedSignaturesFile, comparatorBufferSize) {
        result := ComCall(7, this, "ptr", iSeedSignaturesFile, "uint", comparatorBufferSize, "ptr*", &iComparator := 0, "HRESULT")
        return IRdcComparator(iComparator)
    }

    /**
     * Creates a signature reader to allow an application to decode the contents of a signature file.
     * @param {IRdcFileReader} iFileReader An <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msrdc/nn-msrdc-irdcfilereader">IRdcFileReader</a> interface pointer initialized to read the signatures.
     * @returns {IRdcSignatureReader} Pointer to a location that will receive an 
     *     <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msrdc/nn-msrdc-irdcsignaturereader">IRdcSignatureReader</a> interface pointer. On a 
     *   successful return the interface will be initialized on return. Callers must release the interface.
     * @see https://docs.microsoft.com/windows/win32/api//msrdc/nf-msrdc-irdclibrary-createsignaturereader
     */
    CreateSignatureReader(iFileReader) {
        result := ComCall(8, this, "ptr", iFileReader, "ptr*", &iSignatureReader := 0, "HRESULT")
        return IRdcSignatureReader(iSignatureReader)
    }

    /**
     * Retrieves the version of the installed RDC runtime and the oldest version of the RDC interfaces supported by the installed runtime.
     * @param {Pointer<Integer>} currentVersion Address of a <b>ULONG</b> that will receive the installed version of RDC. This 
     *       corresponds to the <b>MSRDC_VERSION</b> value.
     * @param {Pointer<Integer>} minimumCompatibleAppVersion Address of a <b>ULONG</b> that will receive the oldest version of RDC supported by 
     *       the installed version of RDC. This corresponds to the 
     *       <b>MSRDC_MINIMUM_COMPATIBLE_APP_VERSION</b> value.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//msrdc/nf-msrdc-irdclibrary-getrdcversion
     */
    GetRDCVersion(currentVersion, minimumCompatibleAppVersion) {
        currentVersionMarshal := currentVersion is VarRef ? "uint*" : "ptr"
        minimumCompatibleAppVersionMarshal := minimumCompatibleAppVersion is VarRef ? "uint*" : "ptr"

        result := ComCall(9, this, currentVersionMarshal, currentVersion, minimumCompatibleAppVersionMarshal, minimumCompatibleAppVersion, "HRESULT")
        return result
    }
}
