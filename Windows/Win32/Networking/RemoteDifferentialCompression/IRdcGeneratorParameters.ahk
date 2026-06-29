#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\GeneratorParametersType.ahk" { GeneratorParametersType }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Is the generic interface for all types of generator parameters. All generator parameter objects must support this interface.
 * @see https://learn.microsoft.com/windows/win32/api/msrdc/nn-msrdc-irdcgeneratorparameters
 * @namespace Windows.Win32.Networking.RemoteDifferentialCompression
 */
export default struct IRdcGeneratorParameters extends IUnknown {
    /**
     * The interface identifier for IRdcGeneratorParameters
     * @type {Guid}
     */
    static IID := Guid("{96236a71-9dbc-11da-9e3f-0011114ae311}")

    /**
     * The class identifier for RdcGeneratorParameters
     * @type {Guid}
     */
    static CLSID := Guid("{96236a86-9dbc-11da-9e3f-0011114ae311}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IRdcGeneratorParameters interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetGeneratorParametersType : IntPtr
        GetParametersVersion       : IntPtr
        GetSerializeSize           : IntPtr
        Serialize                  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IRdcGeneratorParameters.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Returns the specific type of the parameters.
     * @returns {GeneratorParametersType} The address of a <a href="https://docs.microsoft.com/windows/win32/api/msrdc/ne-msrdc-generatorparameterstype">GeneratorParametersType</a> that will receive the type of the parameters.
     * @see https://learn.microsoft.com/windows/win32/api/msrdc/nf-msrdc-irdcgeneratorparameters-getgeneratorparameterstype
     */
    GetGeneratorParametersType() {
        result := ComCall(3, this, "int*", &parametersType := 0, "HRESULT")
        return parametersType
    }

    /**
     * Returns information about the version of RDC used to serialize the parameters.
     * @param {Pointer<Integer>} currentVersion Address of a <b>ULONG</b> that will receive the version of RDC used to serialize the 
     *       parameters for this object. This corresponds to the <b>MSRDC_VERSION</b> constant.
     * @param {Pointer<Integer>} minimumCompatibleAppVersion Address of a <b>ULONG</b> that will receive the version of RDC that is compatible 
     *       with the serialized parameters. This corresponds to the 
     *       <b>MSRDC_MINIMUM_COMPATIBLE_APP_VERSION</b> constant.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/msrdc/nf-msrdc-irdcgeneratorparameters-getparametersversion
     */
    GetParametersVersion(currentVersion, minimumCompatibleAppVersion) {
        currentVersionMarshal := currentVersion is VarRef ? "uint*" : "ptr"
        minimumCompatibleAppVersionMarshal := minimumCompatibleAppVersion is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, currentVersionMarshal, currentVersion, minimumCompatibleAppVersionMarshal, minimumCompatibleAppVersion, "HRESULT")
        return result
    }

    /**
     * Returns the size, in bytes, of the serialized parameter data.
     * @returns {Integer} Address of a <b>ULONG</b> that on successful completion is filled with the size, in 
     *       bytes, of the serialized parameter data.
     * @see https://learn.microsoft.com/windows/win32/api/msrdc/nf-msrdc-irdcgeneratorparameters-getserializesize
     */
    GetSerializeSize() {
        result := ComCall(5, this, "uint*", &_size := 0, "HRESULT")
        return _size
    }

    /**
     * Serializes the parameter data into a block of memory.
     * @param {Integer} _size The size of the buffer pointed to by the <i>parametersBlob</i> parameter.
     * @param {Pointer<Integer>} parametersBlob The address of a buffer to receive the serialized parameter data.
     * @param {Pointer<Integer>} bytesWritten Address of a <b>ULONG</b> that on successful completion is filled with the size, in 
     *       bytes, of the serialized parameter data written to the buffer pointed to by the 
     *       <i>parametersBlob</i> parameter.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/msrdc/nf-msrdc-irdcgeneratorparameters-serialize
     */
    Serialize(_size, parametersBlob, bytesWritten) {
        parametersBlobMarshal := parametersBlob is VarRef ? "char*" : "ptr"
        bytesWrittenMarshal := bytesWritten is VarRef ? "uint*" : "ptr"

        result := ComCall(6, this, "uint", _size, parametersBlobMarshal, parametersBlob, bytesWrittenMarshal, bytesWritten, "HRESULT")
        return result
    }

    Query(iid) {
        if (IRdcGeneratorParameters.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetGeneratorParametersType := CallbackCreate(GetMethod(implObj, "GetGeneratorParametersType"), flags, 2)
        this.vtbl.GetParametersVersion := CallbackCreate(GetMethod(implObj, "GetParametersVersion"), flags, 3)
        this.vtbl.GetSerializeSize := CallbackCreate(GetMethod(implObj, "GetSerializeSize"), flags, 2)
        this.vtbl.Serialize := CallbackCreate(GetMethod(implObj, "Serialize"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetGeneratorParametersType)
        CallbackFree(this.vtbl.GetParametersVersion)
        CallbackFree(this.vtbl.GetSerializeSize)
        CallbackFree(this.vtbl.Serialize)
    }
}
