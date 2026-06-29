#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IDedupDataPort.ahk" { IDedupDataPort }
#Import ".\DedupCompressionAlgorithm.ahk" { DedupCompressionAlgorithm }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\DedupChunkingAlgorithm.ahk" { DedupChunkingAlgorithm }
#Import ".\DedupHashingAlgorithm.ahk" { DedupHashingAlgorithm }
#Import ".\DedupDataPortVolumeStatus.ahk" { DedupDataPortVolumeStatus }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Storage.DataDeduplication
 */
export default struct IDedupDataPortManager extends IUnknown {
    /**
     * The interface identifier for IDedupDataPortManager
     * @type {Guid}
     */
    static IID := Guid("{44677452-b90a-445e-8192-cdcfe81511fb}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDedupDataPortManager interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetConfiguration  : IntPtr
        GetVolumeStatus   : IntPtr
        GetVolumeDataPort : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDedupDataPortManager.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Read the active configuration of the collector.
     * @param {Pointer<Integer>} pMinChunkSize 
     * @param {Pointer<Integer>} pMaxChunkSize 
     * @param {Pointer<DedupChunkingAlgorithm>} pChunkingAlgorithm 
     * @param {Pointer<DedupHashingAlgorithm>} pHashingAlgorithm 
     * @param {Pointer<DedupCompressionAlgorithm>} pCompressionAlgorithm 
     * @returns {HRESULT} <dl> <dt>
     * 
     * 
     * </dt> <dd>
     * 
     * 0
     * 
     * Failure
     * 
     * </dd> <dt>
     * 
     * 
     * </dt> <dd>
     * 
     * 1
     * 
     * Success
     * 
     * </dd> </dl>
     * @see https://learn.microsoft.com/windows/win32/BEvtColProv/control-getconfiguration
     */
    GetConfiguration(pMinChunkSize, pMaxChunkSize, pChunkingAlgorithm, pHashingAlgorithm, pCompressionAlgorithm) {
        pMinChunkSizeMarshal := pMinChunkSize is VarRef ? "uint*" : "ptr"
        pMaxChunkSizeMarshal := pMaxChunkSize is VarRef ? "uint*" : "ptr"
        pChunkingAlgorithmMarshal := pChunkingAlgorithm is VarRef ? "int*" : "ptr"
        pHashingAlgorithmMarshal := pHashingAlgorithm is VarRef ? "int*" : "ptr"
        pCompressionAlgorithmMarshal := pCompressionAlgorithm is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, pMinChunkSizeMarshal, pMinChunkSize, pMaxChunkSizeMarshal, pMaxChunkSize, pChunkingAlgorithmMarshal, pChunkingAlgorithm, pHashingAlgorithmMarshal, pHashingAlgorithm, pCompressionAlgorithmMarshal, pCompressionAlgorithm, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Options 
     * @param {BSTR} _Path 
     * @returns {DedupDataPortVolumeStatus} 
     */
    GetVolumeStatus(Options, _Path) {
        _Path := _Path is String ? BSTR.Alloc(_Path).Value : _Path

        result := ComCall(4, this, "uint", Options, BSTR, _Path, "int*", &pStatus := 0, "HRESULT")
        return pStatus
    }

    /**
     * 
     * @param {Integer} Options 
     * @param {BSTR} _Path 
     * @returns {IDedupDataPort} 
     */
    GetVolumeDataPort(Options, _Path) {
        _Path := _Path is String ? BSTR.Alloc(_Path).Value : _Path

        result := ComCall(5, this, "uint", Options, BSTR, _Path, "ptr*", &ppDataPort := 0, "HRESULT")
        return IDedupDataPort(ppDataPort)
    }

    Query(iid) {
        if (IDedupDataPortManager.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetConfiguration := CallbackCreate(GetMethod(implObj, "GetConfiguration"), flags, 6)
        this.vtbl.GetVolumeStatus := CallbackCreate(GetMethod(implObj, "GetVolumeStatus"), flags, 4)
        this.vtbl.GetVolumeDataPort := CallbackCreate(GetMethod(implObj, "GetVolumeDataPort"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetConfiguration)
        CallbackFree(this.vtbl.GetVolumeStatus)
        CallbackFree(this.vtbl.GetVolumeDataPort)
    }
}
