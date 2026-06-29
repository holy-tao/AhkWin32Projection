#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\D3D12_INDEX_BUFFER_STRIP_CUT_VALUE.ahk" { D3D12_INDEX_BUFFER_STRIP_CUT_VALUE }
#Import ".\ID3D12GraphicsCommandList8.ahk" { ID3D12GraphicsCommandList8 }

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct ID3D12GraphicsCommandList9 extends ID3D12GraphicsCommandList8 {
    /**
     * The interface identifier for ID3D12GraphicsCommandList9
     * @type {Guid}
     */
    static IID := Guid("{34ed2808-ffe6-4c2b-b11a-cabd2b0c59e1}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID3D12GraphicsCommandList9 interfaces
    */
    struct Vtbl extends ID3D12GraphicsCommandList8.Vtbl {
        RSSetDepthBias                : IntPtr
        IASetIndexBufferStripCutValue : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID3D12GraphicsCommandList9.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Float} DepthBias 
     * @param {Float} DepthBiasClamp 
     * @param {Float} SlopeScaledDepthBias 
     * @returns {String} Nothing - always returns an empty string
     */
    RSSetDepthBias(DepthBias, DepthBiasClamp, SlopeScaledDepthBias) {
        ComCall(82, this, "float", DepthBias, "float", DepthBiasClamp, "float", SlopeScaledDepthBias)
    }

    /**
     * 
     * @param {D3D12_INDEX_BUFFER_STRIP_CUT_VALUE} IBStripCutValue 
     * @returns {String} Nothing - always returns an empty string
     */
    IASetIndexBufferStripCutValue(IBStripCutValue) {
        ComCall(83, this, D3D12_INDEX_BUFFER_STRIP_CUT_VALUE, IBStripCutValue)
    }

    Query(iid) {
        if (ID3D12GraphicsCommandList9.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.RSSetDepthBias := CallbackCreate(GetMethod(implObj, "RSSetDepthBias"), flags, 4)
        this.vtbl.IASetIndexBufferStripCutValue := CallbackCreate(GetMethod(implObj, "IASetIndexBufferStripCutValue"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.RSSetDepthBias)
        CallbackFree(this.vtbl.IASetIndexBufferStripCutValue)
    }
}
