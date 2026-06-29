#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.Media.Audio
 */
export default struct AudioClient3ActivationParams {
    #StructPack 4

    tracingContextId : Guid

}
