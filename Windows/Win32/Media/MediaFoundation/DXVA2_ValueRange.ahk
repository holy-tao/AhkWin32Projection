#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DXVA2_Fixed32.ahk" { DXVA2_Fixed32 }

/**
 * Defines the range of supported values for a DirectX Video Acceleration (DXVA) operation.
 * @remarks
 * All values in this structure are specified as <a href="https://docs.microsoft.com/windows/desktop/api/dxva2api/ns-dxva2api-dxva2_fixed32">DXVA2_Fixed32</a> structures.
 * @see https://learn.microsoft.com/windows/win32/api/dxva2api/ns-dxva2api-dxva2_valuerange
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct DXVA2_ValueRange {
    #StructPack 4

    /**
     * Minimum supported value.
     */
    MinValue : DXVA2_Fixed32

    /**
     * Maximum supported value.
     */
    MaxValue : DXVA2_Fixed32

    /**
     * Default value.
     */
    DefaultValue : DXVA2_Fixed32

    /**
     * Minimum increment between values.
     */
    StepSize : DXVA2_Fixed32

}
