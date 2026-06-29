#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IRdcSignatureReader.ahk" { IRdcSignatureReader }
#Import ".\IRdcGenerator.ahk" { IRdcGenerator }
#Import ".\IRdcGeneratorParameters.ahk" { IRdcGeneratorParameters }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IRdcFileReader.ahk" { IRdcFileReader }
#Import ".\IRdcComparator.ahk" { IRdcComparator }
#Import ".\GeneratorParametersType.ahk" { GeneratorParametersType }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Is the primary interface for using RDC.
 * @see https://learn.microsoft.com/windows/win32/api/msrdc/nn-msrdc-irdclibrary
 * @namespace Windows.Win32.Networking.RemoteDifferentialCompression
 */
export default struct IRdcLibrary extends IUnknown {
    /**
     * The interface identifier for IRdcLibrary
     * @type {Guid}
     */
    static IID := Guid("{96236a78-9dbc-11da-9e3f-0011114ae311}")

    /**
     * The class identifier for RdcLibrary
     * @type {Guid}
     */
    static CLSID := Guid("{96236a85-9dbc-11da-9e3f-0011114ae311}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IRdcLibrary interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        ComputeDefaultRecursionDepth : IntPtr
        CreateGeneratorParameters    : IntPtr
        OpenGeneratorParameters      : IntPtr
        CreateGenerator              : IntPtr
        CreateComparator             : IntPtr
        CreateSignatureReader        : IntPtr
        GetRDCVersion                : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IRdcLibrary.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Computes the maximum level of recursion for the specified file size.
     * @param {Integer} fileSize The approximate size of the file.
     * @returns {Integer} Pointer to a <b>ULONG</b> that will receive the suggested maximum recursion 
     *     depth.
     * @see https://learn.microsoft.com/windows/win32/api/msrdc/nf-msrdc-irdclibrary-computedefaultrecursiondepth
     */
    ComputeDefaultRecursionDepth(fileSize) {
        result := ComCall(3, this, "uint", fileSize, "uint*", &depth := 0, "HRESULT")
        return depth
    }

    /**
     * Returns an IRdcGeneratorParameters interface pointer initialized with the parameters necessary for a signature generator.
     * @param {GeneratorParametersType} parametersType Specifies the type of signature generator for the created parameters, enumerated by the 
     *     <a href="https://docs.microsoft.com/windows/win32/api/msrdc/ne-msrdc-generatorparameterstype">GeneratorParametersType</a> enumeration. The initial 
     *   release of RDC only supports one type, <b>RDCGENTYPE_FilterMax</b>.
     * @param {Integer} level The recursion level for this parameter block. A parameter block is needed for each level of generated 
     *     signatures. The valid range is from <b>MSRDC_MINIMUM_DEPTH</b> to 
     *   <b>MSRDC_MAXIMUM_DEPTH</b>.
     * @returns {IRdcGeneratorParameters} Pointer to a location that will receive an 
     *     <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msrdc/nn-msrdc-irdcgeneratorparameters">IRdcGeneratorParameters</a> interface pointer. On a 
     *   successful return the interface will be initialized on return. Callers must release the interface.
     * @see https://learn.microsoft.com/windows/win32/api/msrdc/nf-msrdc-irdclibrary-creategeneratorparameters
     */
    CreateGeneratorParameters(parametersType, level) {
        result := ComCall(4, this, GeneratorParametersType, parametersType, "uint", level, "ptr*", &iGeneratorParameters := 0, "HRESULT")
        return IRdcGeneratorParameters(iGeneratorParameters)
    }

    /**
     * Opens an existing serialized parameter block and returns an IRdcGeneratorParameters interface pointer initialized with the data.
     * @remarks
     * To create a serialized parameter block, use the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msrdc/nf-msrdc-irdcgeneratorparameters-serialize">IRdcGeneratorParameters::Serialize</a> method.
     * @param {Integer} _size The size, in bytes, of the serialized parameter block.
     * @param {Pointer<Integer>} parametersBlob Pointer to a serialized parameter block.
     * @returns {IRdcGeneratorParameters} Pointer to a location that will receive the returned 
     *     <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msrdc/nn-msrdc-irdcgeneratorparameters">IRdcGeneratorParameters</a> interface pointer. Callers 
     *   must release the interface.
     * @see https://learn.microsoft.com/windows/win32/api/msrdc/nf-msrdc-irdclibrary-opengeneratorparameters
     */
    OpenGeneratorParameters(_size, parametersBlob) {
        parametersBlobMarshal := parametersBlob is VarRef ? "char*" : "ptr"

        result := ComCall(5, this, "uint", _size, parametersBlobMarshal, parametersBlob, "ptr*", &iGeneratorParameters := 0, "HRESULT")
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
     * @see https://learn.microsoft.com/windows/win32/api/msrdc/nf-msrdc-irdclibrary-creategenerator
     */
    CreateGenerator(depth, iGeneratorParametersArray) {
        result := ComCall(6, this, "uint", depth, IRdcGeneratorParameters.Ptr, iGeneratorParametersArray, "ptr*", &iGenerator := 0, "HRESULT")
        return IRdcGenerator(iGenerator)
    }

    /**
     * Creates a signature comparator.
     * @remarks
     * The caller must create a separate signature comparator for each 
     *     level of recursion.
     * @param {IRdcFileReader} iSeedSignaturesFile An <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msrdc/nn-msrdc-irdcfilereader">IRdcFileReader</a> interface pointer initialized to 
     *       read the seed signatures.
     * @param {Integer} comparatorBufferSize Specifies the size of the comparator buffer. The range is from 
     *       <b>MSRDC_MINIMUM_COMPAREBUFFER</b> to 
     *       <b>MSRDC_MAXIMUM_COMPAREBUFFER</b>.
     * @returns {IRdcComparator} Pointer to a location that will receive an 
     *       <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msrdc/nn-msrdc-irdccomparator">IRdcComparator</a> interface pointer. On a successful return 
     *       the interface will be initialized on return. Callers must release the interface.
     * @see https://learn.microsoft.com/windows/win32/api/msrdc/nf-msrdc-irdclibrary-createcomparator
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
     * @see https://learn.microsoft.com/windows/win32/api/msrdc/nf-msrdc-irdclibrary-createsignaturereader
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
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/msrdc/nf-msrdc-irdclibrary-getrdcversion
     */
    GetRDCVersion(currentVersion, minimumCompatibleAppVersion) {
        currentVersionMarshal := currentVersion is VarRef ? "uint*" : "ptr"
        minimumCompatibleAppVersionMarshal := minimumCompatibleAppVersion is VarRef ? "uint*" : "ptr"

        result := ComCall(9, this, currentVersionMarshal, currentVersion, minimumCompatibleAppVersionMarshal, minimumCompatibleAppVersion, "HRESULT")
        return result
    }

    Query(iid) {
        if (IRdcLibrary.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.ComputeDefaultRecursionDepth := CallbackCreate(GetMethod(implObj, "ComputeDefaultRecursionDepth"), flags, 3)
        this.vtbl.CreateGeneratorParameters := CallbackCreate(GetMethod(implObj, "CreateGeneratorParameters"), flags, 4)
        this.vtbl.OpenGeneratorParameters := CallbackCreate(GetMethod(implObj, "OpenGeneratorParameters"), flags, 4)
        this.vtbl.CreateGenerator := CallbackCreate(GetMethod(implObj, "CreateGenerator"), flags, 4)
        this.vtbl.CreateComparator := CallbackCreate(GetMethod(implObj, "CreateComparator"), flags, 4)
        this.vtbl.CreateSignatureReader := CallbackCreate(GetMethod(implObj, "CreateSignatureReader"), flags, 3)
        this.vtbl.GetRDCVersion := CallbackCreate(GetMethod(implObj, "GetRDCVersion"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.ComputeDefaultRecursionDepth)
        CallbackFree(this.vtbl.CreateGeneratorParameters)
        CallbackFree(this.vtbl.OpenGeneratorParameters)
        CallbackFree(this.vtbl.CreateGenerator)
        CallbackFree(this.vtbl.CreateComparator)
        CallbackFree(this.vtbl.CreateSignatureReader)
        CallbackFree(this.vtbl.GetRDCVersion)
    }
}
