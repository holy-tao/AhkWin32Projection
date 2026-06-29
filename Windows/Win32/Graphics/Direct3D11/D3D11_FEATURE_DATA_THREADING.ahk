#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * Describes the multi-threading features that are supported by the current graphics driver.
 * @remarks
 * Use the D3D11_FEATURE_DATA_THREADING structure with the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11device-checkfeaturesupport">ID3D11Device::CheckFeatureSupport</a> method to determine multi-threading support.
 * @see https://learn.microsoft.com/windows/win32/api/d3d11/ns-d3d11-d3d11_feature_data_threading
 * @namespace Windows.Win32.Graphics.Direct3D11
 */
export default struct D3D11_FEATURE_DATA_THREADING {
    #StructPack 4

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * <b>TRUE</b> means resources can be created concurrently on multiple threads while drawing; <b>FALSE</b> means that the presence of coarse synchronization will prevent concurrency.
     */
    DriverConcurrentCreates : BOOL

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * <b>TRUE</b> means command lists are supported by the current driver; <b>FALSE</b> means that the API will emulate deferred contexts and command lists with software.
     */
    DriverCommandLists : BOOL

}
