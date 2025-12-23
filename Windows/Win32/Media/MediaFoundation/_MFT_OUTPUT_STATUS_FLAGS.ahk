#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Indicates whether a Media Foundation transform (MFT) can produce output data.
 * @see https://learn.microsoft.com/windows/win32/api/mftransform/ne-mftransform-_mft_output_status_flags
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class _MFT_OUTPUT_STATUS_FLAGS extends Win32Enum{

    /**
     * There is a sample available for at least one output stream. To retrieve the available output samples, call <a href="https://docs.microsoft.com/windows/desktop/api/mftransform/nf-mftransform-imftransform-processoutput">IMFTransform::ProcessOutput</a>.
     * @type {Integer (Int32)}
     */
    static MFT_OUTPUT_STATUS_SAMPLE_READY => 1
}
