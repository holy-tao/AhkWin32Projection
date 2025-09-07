#Requires AutoHotkey v2.0.0 64-bit

/**
 * The SmartCardAssociationType enumeration type specifies a smart card association.
 * @see https://learn.microsoft.com/windows/win32/api/bdaiface/ne-bdaiface-smartcardassociationtype
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class SmartCardAssociationType{

    /**
     * Not associated.
     * @type {Integer (Int32)}
     */
    static NotAssociated => 0

    /**
     * Associated.
     * @type {Integer (Int32)}
     */
    static Associated => 1

    /**
     * Association status is unknown.
     * @type {Integer (Int32)}
     */
    static AssociationUnknown => 2
}
