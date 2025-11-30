#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * The AppPolicyClrCompat enumeration indicates the application type of a process so that you can determine whether to enable private reflection and/or make managed objects agile.
 * @see https://docs.microsoft.com/windows/win32/api//appmodel/ne-appmodel-apppolicyclrcompat
 * @namespace Windows.Win32.Storage.Packaging.Appx
 * @version v4.0.30319
 */
class AppPolicyClrCompat extends Win32Enum{

    /**
     * Indicates an application type other than the ones indicated by the other enumerated constants. The Common Language Runtime (CLR) should not be called by applications that are not Universal Windows Platform (UWP), Win32, nor Desktop Bridge.
     * @type {Integer (Int32)}
     */
    static AppPolicyClrCompat_Other => 0

    /**
     * Indicates a desktop/Win32 application, or an NT service. You can support private reflection on framework types.
     * @type {Integer (Int32)}
     */
    static AppPolicyClrCompat_ClassicDesktop => 1

    /**
     * Indicates a Universal Windows Platform (UWP) application. You should disable private reflection on framework types, but you can support IAgileObject.
     * @type {Integer (Int32)}
     */
    static AppPolicyClrCompat_Universal => 2

    /**
     * Indicates a Desktop Bridge application. You can support private reflection on framework types, and you can support IAgileObject.
     * @type {Integer (Int32)}
     */
    static AppPolicyClrCompat_PackagedDesktop => 3
}
