import * as cds from "@sap/cds";
import { sendCommunicationRequest } from "./entities/exploration";

export = (srv: cds.Service) => {
    srv.on("sendCommunicationRequest", async (req) => {
        return await sendCommunicationRequest(req);
    },
    )};
