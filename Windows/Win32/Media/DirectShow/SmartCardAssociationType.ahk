#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The SmartCardAssociationType enumeration type specifies a smart card association.
 * @see https://learn.microsoft.com/windows/win32/api/bdaiface/ne-bdaiface-smartcardassociationtype
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct SmartCardAssociationType {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
