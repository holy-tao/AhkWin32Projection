#Requires AutoHotkey v2.1-alpha.26+ 64-bit

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
 */
export default struct FaceCharacterization {
    #StructPack 4

    /**
     * 0 indicates no blink for the left eye, 100 indicates definite blink for the left eye (0 - 100).
     */
    BlinkScoreLeft : UInt32

    /**
     * 0 indicates no blink for the right eye, 100 indicates definite blink for the right eye (0 - 100).
     */
    BlinkScoreRight : UInt32

    /**
     * A  defined facial expression value.
     */
    FacialExpression : UInt32

    /**
     * 0 indicates no such facial expression as identified, 100 indicates definite such facial expression as defined (0 - 100).
     */
    FacialExpressionScore : UInt32

}
