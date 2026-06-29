#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct DXGKMDT_OPM_ENCRYPTED_PARAMETERS {
    #StructPack 1

    abEncryptedParameters : Int8[256]

}
