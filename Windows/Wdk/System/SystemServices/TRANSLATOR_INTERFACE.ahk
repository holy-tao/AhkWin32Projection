#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PTRANSLATE_RESOURCE_REQUIREMENTS_HANDLER.ahk" { PTRANSLATE_RESOURCE_REQUIREMENTS_HANDLER }
#Import ".\PTRANSLATE_RESOURCE_HANDLER.ahk" { PTRANSLATE_RESOURCE_HANDLER }
#Import ".\PINTERFACE_DEREFERENCE.ahk" { PINTERFACE_DEREFERENCE }
#Import ".\PINTERFACE_REFERENCE.ahk" { PINTERFACE_REFERENCE }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct TRANSLATOR_INTERFACE {
    #StructPack 8

    Size : UInt16

    Version : UInt16

    Context : IntPtr

    InterfaceReference : PINTERFACE_REFERENCE

    InterfaceDereference : PINTERFACE_DEREFERENCE

    TranslateResources : PTRANSLATE_RESOURCE_HANDLER

    TranslateResourceRequirements : PTRANSLATE_RESOURCE_REQUIREMENTS_HANDLER

}
