#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\IStream.ahk" { IStream }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * Use this interface to generate a read-only data stream whose data is initialized with pseudo-random data (not cryptographically safe). You must call the SetSize method to set the requested size of the stream.
 * @remarks
 * To create the <b>MsftStreamPrgn001</b> object in a script, use IMAPI2.MsftStreamPrgn001 as the program identifier when calling <b>CreateObject</b>.
 * @see https://learn.microsoft.com/windows/win32/api/imapi2/nn-imapi2-istreampseudorandombased
 * @namespace Windows.Win32.Storage.Imapi
 */
export default struct IStreamPseudoRandomBased extends IStream {
    /**
     * The interface identifier for IStreamPseudoRandomBased
     * @type {Guid}
     */
    static IID := Guid("{27354145-7f64-5b0f-8f00-5d77afbe261e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IStreamPseudoRandomBased interfaces
    */
    struct Vtbl extends IStream.Vtbl {
        put_Seed         : IntPtr
        get_Seed         : IntPtr
        put_ExtendedSeed : IntPtr
        get_ExtendedSeed : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IStreamPseudoRandomBased.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {Integer} 
     */
    Seed {
        get => this.get_Seed()
        set => this.put_Seed(value)
    }

    /**
     * Sets the seed value used by the random number generator and seeks to the start of stream.
     * @param {Integer} value Seed value for the random number generator.
     * @returns {HRESULT} S_OK is returned on success, but other success codes may be returned as a result of implementation.
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-istreampseudorandombased-put_seed
     */
    put_Seed(value) {
        result := ComCall(14, this, "uint", value, "HRESULT")
        return result
    }

    /**
     * Retrieves the seed value used by the random number generator.
     * @returns {Integer} Seed value for the random number generator.
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-istreampseudorandombased-get_seed
     */
    get_Seed() {
        result := ComCall(15, this, "uint*", &value := 0, "HRESULT")
        return value
    }

    /**
     * Sets a list of seed values for the random number generator and seeks to the start of stream.
     * @remarks
     * Use this method to provide a seed value greater than 32 bits.
     * @param {Pointer<Integer>} values Array of seed values used by the random number generator.
     * @param {Integer} eCount Number of seed values in the <i>values</i> array.
     * @returns {HRESULT} S_OK is returned on success, but other success codes may be returned as a result of implementation. The following error codes are commonly returned on operation failure, but do not represent the only possible error values:
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOTIMPL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Not implemented.
     * 
     * Value: 0x80004001
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-istreampseudorandombased-put_extendedseed
     */
    put_ExtendedSeed(values, eCount) {
        valuesMarshal := values is VarRef ? "uint*" : "ptr"

        result := ComCall(16, this, valuesMarshal, values, "uint", eCount, "HRESULT")
        return result
    }

    /**
     * Retrieves an array of seed values used by the random number generator.
     * @param {Pointer<Pointer<Integer>>} values Array of seed values used by the random number generator.
     * @param {Pointer<Integer>} eCount Number of seed values in the <i>values</i> array.
     * @returns {HRESULT} S_OK is returned on success, but other success codes may be returned as a result of implementation. The following error codes are commonly returned on operation failure, but do not represent the only possible error values:
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOTIMPL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Not implemented.
     * 
     * Value: 0x80004001
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-istreampseudorandombased-get_extendedseed
     */
    get_ExtendedSeed(values, eCount) {
        valuesMarshal := values is VarRef ? "ptr*" : "ptr"
        eCountMarshal := eCount is VarRef ? "uint*" : "ptr"

        result := ComCall(17, this, valuesMarshal, values, eCountMarshal, eCount, "HRESULT")
        return result
    }

    Query(iid) {
        if (IStreamPseudoRandomBased.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.put_Seed := CallbackCreate(GetMethod(implObj, "put_Seed"), flags, 2)
        this.vtbl.get_Seed := CallbackCreate(GetMethod(implObj, "get_Seed"), flags, 2)
        this.vtbl.put_ExtendedSeed := CallbackCreate(GetMethod(implObj, "put_ExtendedSeed"), flags, 3)
        this.vtbl.get_ExtendedSeed := CallbackCreate(GetMethod(implObj, "get_ExtendedSeed"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.put_Seed)
        CallbackFree(this.vtbl.get_Seed)
        CallbackFree(this.vtbl.put_ExtendedSeed)
        CallbackFree(this.vtbl.get_ExtendedSeed)
    }
}
