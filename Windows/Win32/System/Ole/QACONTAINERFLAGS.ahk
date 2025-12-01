#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Indicates ambient properties supplied by the container. It is used in the dwAmbientFlags member of the QACONTAINER structure.
 * @see https://learn.microsoft.com/windows/win32/api/ocidl/ne-ocidl-qacontainerflags
 * @namespace Windows.Win32.System.Ole
 * @version v4.0.30319
 */
class QACONTAINERFLAGS extends Win32Enum{

    /**
     * Specifies the ShowHatching ambient property, which has a standard ambient DISPID of -712.
     * @type {Integer (Int32)}
     */
    static QACONTAINER_SHOWHATCHING => 1

    /**
     * Specifies the ShowGrabHandles ambient property, which has a standard ambient DISPID of -711.
     * @type {Integer (Int32)}
     */
    static QACONTAINER_SHOWGRABHANDLES => 2

    /**
     * Specifies the UserMode ambient property, which has a standard ambient DISPID of -709.
     * @type {Integer (Int32)}
     */
    static QACONTAINER_USERMODE => 4

    /**
     * Specifies the DisplayAsDefault ambient property, which has a standard ambient DISPID of -713.
     * @type {Integer (Int32)}
     */
    static QACONTAINER_DISPLAYASDEFAULT => 8

    /**
     * Specifies the UIDead ambient property, which has a standard ambient DISPID of -710.
     * @type {Integer (Int32)}
     */
    static QACONTAINER_UIDEAD => 16

    /**
     * Specifies the AutoClip ambient property, which has a standard ambient DISPID of -715.
     * @type {Integer (Int32)}
     */
    static QACONTAINER_AUTOCLIP => 32

    /**
     * Specifies the MessageReflect ambient property, which has a standard ambient DISPID of -706.
     * @type {Integer (Int32)}
     */
    static QACONTAINER_MESSAGEREFLECT => 64

    /**
     * Specifies the SupportsMnemonics ambient property, which has a standard ambient DISPID of -714.
     * @type {Integer (Int32)}
     */
    static QACONTAINER_SUPPORTSMNEMONICS => 128
}
