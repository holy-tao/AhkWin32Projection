#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit

#Import "..\..\..\System\Com\IMalloc.ahk" { IMalloc }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.Graphics.Direct3D.Dxc
 */

;@region Functions
/**
 * 
 * @param {Pointer<Guid>} rclsid 
 * @param {Pointer<Guid>} riid 
 * @returns {Pointer<Void>} 
 */
export DxcCreateInstance(rclsid, riid) {
    result := DllCall("dxcompiler.dll\DxcCreateInstance", Guid.Ptr, rclsid, Guid.Ptr, riid, "ptr*", &ppv := 0, "HRESULT")
    return ppv
}

/**
 * 
 * @param {IMalloc} pMalloc 
 * @param {Pointer<Guid>} rclsid 
 * @param {Pointer<Guid>} riid 
 * @returns {Pointer<Void>} 
 */
export DxcCreateInstance2(pMalloc, rclsid, riid) {
    result := DllCall("dxcompiler.dll\DxcCreateInstance2", "ptr", pMalloc, Guid.Ptr, rclsid, Guid.Ptr, riid, "ptr*", &ppv := 0, "HRESULT")
    return ppv
}

;@endregion Functions
