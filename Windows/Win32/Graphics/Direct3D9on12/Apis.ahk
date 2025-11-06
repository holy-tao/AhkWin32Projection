#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Handle.ahk
#Include ..\Direct3D9\IDirect3D9Ex.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D9on12
 * @version v4.0.30319
 */
class Direct3D9on12 {

;@region Constants

    /**
     * @type {Integer (UInt32)}
     */
    static MAX_D3D9ON12_QUEUES => 2
;@endregion Constants

;@region Methods
    /**
     * 
     * @param {Integer} SDKVersion 
     * @param {Pointer<D3D9ON12_ARGS>} pOverrideList 
     * @param {Integer} NumOverrideEntries 
     * @returns {IDirect3D9Ex} 
     */
    static Direct3DCreate9On12Ex(SDKVersion, pOverrideList, NumOverrideEntries) {
        result := DllCall("d3d9.dll\Direct3DCreate9On12Ex", "uint", SDKVersion, "ptr", pOverrideList, "uint", NumOverrideEntries, "ptr*", &ppOutputInterface := 0, "int")
        if(result != 0)
            throw OSError(result)

        return IDirect3D9Ex(ppOutputInterface)
    }

    /**
     * 
     * @param {Integer} SDKVersion 
     * @param {Pointer<D3D9ON12_ARGS>} pOverrideList 
     * @param {Integer} NumOverrideEntries 
     * @returns {IDirect3D9} 
     */
    static Direct3DCreate9On12(SDKVersion, pOverrideList, NumOverrideEntries) {
        result := DllCall("d3d9.dll\Direct3DCreate9On12", "uint", SDKVersion, "ptr", pOverrideList, "uint", NumOverrideEntries, "ptr")
        return result
    }

;@endregion Methods
}
