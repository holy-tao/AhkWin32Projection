#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.WinRT.Metadata
 * @version v4.0.30319
 */
class CorNotificationForTokenMovement extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static MDNotifyDefault => 15

    /**
     * @type {Integer (Int32)}
     */
    static MDNotifyAll => -1

    /**
     * @type {Integer (Int32)}
     */
    static MDNotifyNone => 0

    /**
     * @type {Integer (Int32)}
     */
    static MDNotifyMethodDef => 1

    /**
     * @type {Integer (Int32)}
     */
    static MDNotifyMemberRef => 2

    /**
     * @type {Integer (Int32)}
     */
    static MDNotifyFieldDef => 4

    /**
     * @type {Integer (Int32)}
     */
    static MDNotifyTypeRef => 8

    /**
     * @type {Integer (Int32)}
     */
    static MDNotifyTypeDef => 16

    /**
     * @type {Integer (Int32)}
     */
    static MDNotifyParamDef => 32

    /**
     * @type {Integer (Int32)}
     */
    static MDNotifyInterfaceImpl => 64

    /**
     * @type {Integer (Int32)}
     */
    static MDNotifyProperty => 128

    /**
     * @type {Integer (Int32)}
     */
    static MDNotifyEvent => 256

    /**
     * @type {Integer (Int32)}
     */
    static MDNotifySignature => 512

    /**
     * @type {Integer (Int32)}
     */
    static MDNotifyTypeSpec => 1024

    /**
     * @type {Integer (Int32)}
     */
    static MDNotifyCustomAttribute => 2048

    /**
     * @type {Integer (Int32)}
     */
    static MDNotifySecurityValue => 4096

    /**
     * @type {Integer (Int32)}
     */
    static MDNotifyPermission => 8192

    /**
     * @type {Integer (Int32)}
     */
    static MDNotifyModuleRef => 16384

    /**
     * @type {Integer (Int32)}
     */
    static MDNotifyNameSpace => 32768

    /**
     * @type {Integer (Int32)}
     */
    static MDNotifyAssemblyRef => 16777216

    /**
     * @type {Integer (Int32)}
     */
    static MDNotifyFile => 33554432

    /**
     * @type {Integer (Int32)}
     */
    static MDNotifyExportedType => 67108864

    /**
     * @type {Integer (Int32)}
     */
    static MDNotifyResource => 134217728
}
