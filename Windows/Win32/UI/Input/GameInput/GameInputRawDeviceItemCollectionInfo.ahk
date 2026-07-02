#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\GameInputRawDeviceItemCollectionKind.ahk" { GameInputRawDeviceItemCollectionKind }
#Import ".\GameInputUsage.ahk" { GameInputUsage }

/**
 * @namespace Windows.Win32.UI.Input.GameInput
 */
export default struct GameInputRawDeviceItemCollectionInfo {
    #StructPack 8

    kind : GameInputRawDeviceItemCollectionKind

    childCount : UInt32

    siblingCount : UInt32

    usageCount : UInt32

    usages : GameInputUsage.Ptr

    parent : GameInputRawDeviceItemCollectionInfo.Ptr

    firstSibling : GameInputRawDeviceItemCollectionInfo.Ptr

    previousSibling : GameInputRawDeviceItemCollectionInfo.Ptr

    nextSibling : GameInputRawDeviceItemCollectionInfo.Ptr

    lastSibling : GameInputRawDeviceItemCollectionInfo.Ptr

    firstChild : GameInputRawDeviceItemCollectionInfo.Ptr

    lastChild : GameInputRawDeviceItemCollectionInfo.Ptr

}
