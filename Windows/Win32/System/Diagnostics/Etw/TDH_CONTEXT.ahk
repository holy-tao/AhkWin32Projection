#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\TDH_CONTEXT_TYPE.ahk" { TDH_CONTEXT_TYPE }

/**
 * Defines the additional information required to parse an event.
 * @see https://learn.microsoft.com/windows/win32/api/tdh/ns-tdh-tdh_context
 * @namespace Windows.Win32.System.Diagnostics.Etw
 */
export default struct TDH_CONTEXT {
    #StructPack 8

    /**
     * Context value cast to a ULONGLONG. The context value is determined by the context type specified in <b>ParameterType</b>. For example, if the context type is TDH_CONTEXT_WPP_TMFFILE, the context value is a Unicode string that contains the name of the .tmf file.
     */
    ParameterValue : Int64

    /**
     * Context type. For a list of types, see the <a href="https://docs.microsoft.com/windows/desktop/api/tdh/ne-tdh-tdh_context_type">TDH_CONTEXT_TYPE</a> enumeration.
     */
    ParameterType : TDH_CONTEXT_TYPE

    /**
     * Reserved for future use.
     */
    ParameterSize : UInt32

}
