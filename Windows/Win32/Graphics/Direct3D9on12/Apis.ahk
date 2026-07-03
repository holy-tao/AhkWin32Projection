#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit

#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Direct3D9\IDirect3D9.ahk" { IDirect3D9 }
#Import "..\Direct3D9\IDirect3D9Ex.ahk" { IDirect3D9Ex }
#Import ".\D3D9ON12_ARGS.ahk" { D3D9ON12_ARGS }

/**
 * @namespace Windows.Win32.Graphics.Direct3D9on12
 */

;@region Functions
/**
 * 
 * @param {Integer} SDKVersion 
 * @param {Pointer<D3D9ON12_ARGS>} pOverrideList 
 * @param {Integer} NumOverrideEntries 
 * @returns {IDirect3D9Ex} 
 */
export Direct3DCreate9On12Ex(SDKVersion, pOverrideList, NumOverrideEntries) {
    result := DllCall("d3d9.dll\Direct3DCreate9On12Ex", UInt32, SDKVersion, D3D9ON12_ARGS.Ptr, pOverrideList, UInt32, NumOverrideEntries, "ptr*", &ppOutputInterface := 0, "HRESULT")
    return IDirect3D9Ex(ppOutputInterface)
}

/**
 * 
 * @param {Integer} SDKVersion 
 * @param {Pointer<D3D9ON12_ARGS>} pOverrideList 
 * @param {Integer} NumOverrideEntries 
 * @returns {IDirect3D9} 
 */
export Direct3DCreate9On12(SDKVersion, pOverrideList, NumOverrideEntries) {
    result := DllCall("d3d9.dll\Direct3DCreate9On12", UInt32, SDKVersion, D3D9ON12_ARGS.Ptr, pOverrideList, UInt32, NumOverrideEntries, IDirect3D9)
    return result
}

;@endregion Functions
