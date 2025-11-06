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
     * 
     * @param {Integer} fileSize 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/msrdc/nf-msrdc-irdclibrary-computedefaultrecursiondepth
     */
    ComputeDefaultRecursionDepth(fileSize) {
        result := ComCall(3, this, "uint", fileSize, "uint*", &depth := 0, "HRESULT")
        return depth
    }

    /**
     * 
     * @param {Integer} parametersType 
     * @param {Integer} level 
     * @returns {IRdcGeneratorParameters} 
     * @see https://learn.microsoft.com/windows/win32/api/msrdc/nf-msrdc-irdclibrary-creategeneratorparameters
     */
    CreateGeneratorParameters(parametersType, level) {
        result := ComCall(4, this, "int", parametersType, "uint", level, "ptr*", &iGeneratorParameters := 0, "HRESULT")
        return IRdcGeneratorParameters(iGeneratorParameters)
    }

    /**
     * 
     * @param {Integer} size 
     * @param {Pointer<Integer>} parametersBlob 
     * @returns {IRdcGeneratorParameters} 
     * @see https://learn.microsoft.com/windows/win32/api/msrdc/nf-msrdc-irdclibrary-opengeneratorparameters
     */
    OpenGeneratorParameters(size, parametersBlob) {
        parametersBlobMarshal := parametersBlob is VarRef ? "char*" : "ptr"

        result := ComCall(5, this, "uint", size, parametersBlobMarshal, parametersBlob, "ptr*", &iGeneratorParameters := 0, "HRESULT")
        return IRdcGeneratorParameters(iGeneratorParameters)
    }

    /**
     * 
     * @param {Integer} depth 
     * @param {Pointer<IRdcGeneratorParameters>} iGeneratorParametersArray 
     * @returns {IRdcGenerator} 
     * @see https://learn.microsoft.com/windows/win32/api/msrdc/nf-msrdc-irdclibrary-creategenerator
     */
    CreateGenerator(depth, iGeneratorParametersArray) {
        result := ComCall(6, this, "uint", depth, "ptr*", iGeneratorParametersArray, "ptr*", &iGenerator := 0, "HRESULT")
        return IRdcGenerator(iGenerator)
    }

    /**
     * 
     * @param {IRdcFileReader} iSeedSignaturesFile 
     * @param {Integer} comparatorBufferSize 
     * @returns {IRdcComparator} 
     * @see https://learn.microsoft.com/windows/win32/api/msrdc/nf-msrdc-irdclibrary-createcomparator
     */
    CreateComparator(iSeedSignaturesFile, comparatorBufferSize) {
        result := ComCall(7, this, "ptr", iSeedSignaturesFile, "uint", comparatorBufferSize, "ptr*", &iComparator := 0, "HRESULT")
        return IRdcComparator(iComparator)
    }

    /**
     * 
     * @param {IRdcFileReader} iFileReader 
     * @returns {IRdcSignatureReader} 
     * @see https://learn.microsoft.com/windows/win32/api/msrdc/nf-msrdc-irdclibrary-createsignaturereader
     */
    CreateSignatureReader(iFileReader) {
        result := ComCall(8, this, "ptr", iFileReader, "ptr*", &iSignatureReader := 0, "HRESULT")
        return IRdcSignatureReader(iSignatureReader)
    }

    /**
     * 
     * @param {Pointer<Integer>} currentVersion 
     * @param {Pointer<Integer>} minimumCompatibleAppVersion 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msrdc/nf-msrdc-irdclibrary-getrdcversion
     */
    GetRDCVersion(currentVersion, minimumCompatibleAppVersion) {
        currentVersionMarshal := currentVersion is VarRef ? "uint*" : "ptr"
        minimumCompatibleAppVersionMarshal := minimumCompatibleAppVersion is VarRef ? "uint*" : "ptr"

        result := ComCall(9, this, currentVersionMarshal, currentVersion, minimumCompatibleAppVersionMarshal, minimumCompatibleAppVersion, "HRESULT")
        return result
    }
}
