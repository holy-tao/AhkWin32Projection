#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BOOL.ahk

/**
 * Describes the multi-threading features that are supported by the current graphics driver.
 * @remarks
 * 
  * Use the D3D11_FEATURE_DATA_THREADING structure with the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11device-checkfeaturesupport">ID3D11Device::CheckFeatureSupport</a> method to determine multi-threading support.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d11/ns-d3d11-d3d11_feature_data_threading
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class D3D11_FEATURE_DATA_THREADING extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * <b>TRUE</b> means resources can be created concurrently on multiple threads while drawing; <b>FALSE</b> means that the presence of coarse synchronization will prevent concurrency.
     * @type {BOOL}
     */
    DriverConcurrentCreates{
        get {
            if(!this.HasProp("__DriverConcurrentCreates"))
                this.__DriverConcurrentCreates := BOOL(this.ptr + 0)
            return this.__DriverConcurrentCreates
        }
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * <b>TRUE</b> means command lists are supported by the current driver; <b>FALSE</b> means that the API will emulate deferred contexts and command lists with software.
     * @type {BOOL}
     */
    DriverCommandLists{
        get {
            if(!this.HasProp("__DriverCommandLists"))
                this.__DriverCommandLists := BOOL(this.ptr + 4)
            return this.__DriverCommandLists
        }
    }
}
