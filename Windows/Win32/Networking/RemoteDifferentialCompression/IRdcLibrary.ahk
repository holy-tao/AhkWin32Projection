#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * @param {Pointer<Integer>} depth 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msrdc/nf-msrdc-irdclibrary-computedefaultrecursiondepth
     */
    ComputeDefaultRecursionDepth(fileSize, depth) {
        depthMarshal := depth is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "uint", fileSize, depthMarshal, depth, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} parametersType 
     * @param {Integer} level 
     * @param {Pointer<IRdcGeneratorParameters>} iGeneratorParameters 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msrdc/nf-msrdc-irdclibrary-creategeneratorparameters
     */
    CreateGeneratorParameters(parametersType, level, iGeneratorParameters) {
        result := ComCall(4, this, "int", parametersType, "uint", level, "ptr*", iGeneratorParameters, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} size 
     * @param {Pointer<Integer>} parametersBlob 
     * @param {Pointer<IRdcGeneratorParameters>} iGeneratorParameters 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msrdc/nf-msrdc-irdclibrary-opengeneratorparameters
     */
    OpenGeneratorParameters(size, parametersBlob, iGeneratorParameters) {
        parametersBlobMarshal := parametersBlob is VarRef ? "char*" : "ptr"

        result := ComCall(5, this, "uint", size, parametersBlobMarshal, parametersBlob, "ptr*", iGeneratorParameters, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} depth 
     * @param {Pointer<IRdcGeneratorParameters>} iGeneratorParametersArray 
     * @param {Pointer<IRdcGenerator>} iGenerator 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msrdc/nf-msrdc-irdclibrary-creategenerator
     */
    CreateGenerator(depth, iGeneratorParametersArray, iGenerator) {
        result := ComCall(6, this, "uint", depth, "ptr*", iGeneratorParametersArray, "ptr*", iGenerator, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IRdcFileReader} iSeedSignaturesFile 
     * @param {Integer} comparatorBufferSize 
     * @param {Pointer<IRdcComparator>} iComparator 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msrdc/nf-msrdc-irdclibrary-createcomparator
     */
    CreateComparator(iSeedSignaturesFile, comparatorBufferSize, iComparator) {
        result := ComCall(7, this, "ptr", iSeedSignaturesFile, "uint", comparatorBufferSize, "ptr*", iComparator, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IRdcFileReader} iFileReader 
     * @param {Pointer<IRdcSignatureReader>} iSignatureReader 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msrdc/nf-msrdc-irdclibrary-createsignaturereader
     */
    CreateSignatureReader(iFileReader, iSignatureReader) {
        result := ComCall(8, this, "ptr", iFileReader, "ptr*", iSignatureReader, "HRESULT")
        return result
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
