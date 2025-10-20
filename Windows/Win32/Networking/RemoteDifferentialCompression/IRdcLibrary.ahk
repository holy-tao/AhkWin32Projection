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
     * 
     * @param {Integer} fileSize 
     * @param {Pointer<UInt32>} depth 
     * @returns {HRESULT} 
     */
    ComputeDefaultRecursionDepth(fileSize, depth) {
        result := ComCall(3, this, "uint", fileSize, "uint*", depth, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} parametersType 
     * @param {Integer} level 
     * @param {Pointer<IRdcGeneratorParameters>} iGeneratorParameters 
     * @returns {HRESULT} 
     */
    CreateGeneratorParameters(parametersType, level, iGeneratorParameters) {
        result := ComCall(4, this, "int", parametersType, "uint", level, "ptr", iGeneratorParameters, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} size 
     * @param {Pointer<Byte>} parametersBlob 
     * @param {Pointer<IRdcGeneratorParameters>} iGeneratorParameters 
     * @returns {HRESULT} 
     */
    OpenGeneratorParameters(size, parametersBlob, iGeneratorParameters) {
        result := ComCall(5, this, "uint", size, "char*", parametersBlob, "ptr", iGeneratorParameters, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} depth 
     * @param {Pointer<IRdcGeneratorParameters>} iGeneratorParametersArray 
     * @param {Pointer<IRdcGenerator>} iGenerator 
     * @returns {HRESULT} 
     */
    CreateGenerator(depth, iGeneratorParametersArray, iGenerator) {
        result := ComCall(6, this, "uint", depth, "ptr", iGeneratorParametersArray, "ptr", iGenerator, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IRdcFileReader>} iSeedSignaturesFile 
     * @param {Integer} comparatorBufferSize 
     * @param {Pointer<IRdcComparator>} iComparator 
     * @returns {HRESULT} 
     */
    CreateComparator(iSeedSignaturesFile, comparatorBufferSize, iComparator) {
        result := ComCall(7, this, "ptr", iSeedSignaturesFile, "uint", comparatorBufferSize, "ptr", iComparator, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IRdcFileReader>} iFileReader 
     * @param {Pointer<IRdcSignatureReader>} iSignatureReader 
     * @returns {HRESULT} 
     */
    CreateSignatureReader(iFileReader, iSignatureReader) {
        result := ComCall(8, this, "ptr", iFileReader, "ptr", iSignatureReader, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} currentVersion 
     * @param {Pointer<UInt32>} minimumCompatibleAppVersion 
     * @returns {HRESULT} 
     */
    GetRDCVersion(currentVersion, minimumCompatibleAppVersion) {
        result := ComCall(9, this, "uint*", currentVersion, "uint*", minimumCompatibleAppVersion, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
