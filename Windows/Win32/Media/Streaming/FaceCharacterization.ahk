#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The FaceCharacterization structure describes the blob format for the MF_CAPTURE_METADATA_FACEROICHARACTERIZATIONS attribute.
 * @remarks
 * The <b>MF_CAPTURE_METADATA_FACEROICHARACTERIZATIONS</b> attribute contains the blink and facial expression state for the face ROIs identified in <b>MF_CAPTURE_METADATA_FACEROIS</b>.  For a  device that does not support blink or facial expression detection, this attribute should be omitted.
 * 
 * The facial expressions that can be detected are defined as follows:
 * 
 * 
 * ```
 * @see https://learn.microsoft.com/windows/win32/api/mfapi/ns-mfapi-facecharacterization
 * @namespace Windows.Win32.Media.Streaming
 * @version v4.0.30319
 */
class FaceCharacterization extends Win32Struct
{
    static sizeof => 16

    static packingSize => 4

    /**
     * 0 indicates no blink for the left eye, 100 indicates definite blink for the left eye (0 - 100).
     * @type {Integer}
     */
    BlinkScoreLeft {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * 0 indicates no blink for the right eye, 100 indicates definite blink for the right eye (0 - 100).
     * @type {Integer}
     */
    BlinkScoreRight {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * A  defined facial expression value.
     * @type {Integer}
     */
    FacialExpression {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * 0 indicates no such facial expression as identified, 100 indicates definite such facial expression as defined (0 - 100).
     * @type {Integer}
     */
    FacialExpressionScore {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }
}
