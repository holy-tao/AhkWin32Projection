#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/gender
 * @namespace Windows.Win32.System.AddressBook
 */
export default struct Gender {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * > The gender is not specified for the messaging user.
     * @type {Integer (Int32)}
     */
    static genderUnspecified => 0

    /**
     * > The messaging user is female.
     * @type {Integer (Int32)}
     */
    static genderFemale => 1

    /**
     * > The messaging user is male.
     * @type {Integer (Int32)}
     */
    static genderMale => 2
}
