interface Exception {
    code: number;
    message: string;
    data?: any;
}

export const NotFound: Exception = {
    code: 101,
    message: "NotFound"
};

export const AlreadyExist: Exception = {
    code: 102,
    message: "AlreadyExist"
};

export const DBError: Exception = {
    code: 103,
    message: "DBError"
};

export const InvalidParcel: Exception = {
    code: 104,
    message: "InvalidParcel"
};

export const InvalidAction: Exception = {
    code: 105,
    message: "InvalidAction"
};

export const InvalidTransaction: Exception = {
    code: 106,
    message: "InvalidTransaction"
};

export const InvalidBlockNumber: Exception = {
    code: 107,
    message: "InvalidBlockNumber"
};
